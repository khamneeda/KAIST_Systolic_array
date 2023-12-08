#include <math.h>
#include <stdio.h>
#include <stdlib.h>

void c_free(void *ptr) {
    free(ptr);
}

float *leaky_relu(float *input, int length, float alpha) {
    float *output = (float *)malloc(sizeof(float) * length);
    for (int i = 0; i < length; ++i) {
        if (input[i] > 0)
            output[i] = input[i];
        else
            output[i] = input[i] * alpha;
    }
    return output;
}

// N,och,H,W
float *batch_norm(float *input, float *running_mean, float *running_var, float *weight, float *bias, int n, int c, int h, int w) {
    float *output = (float *)malloc(sizeof(float) * n * c * h * w);
    int hw = h * w;
    int input_size = n * c * hw;
    float eps = 1e-5;

    for (int i = 0; i < input_size; ++i) {
        int ci = (i / hw) % c;
        output[i] = (input[i] - running_mean[ci]) / sqrt(running_var[ci] + eps) * weight[ci] + bias[ci];
    }

    return output;
}

// input: N,C,H,W
// output: N,och,H,W
// kernel: och,C,kh,kw
// bias: och

// assume the following
//  - H,W output size the same as input H,W
//    - stride 1,1, padding 0
//  - odd number kernel h,w
float *conv2d(float *input, float *kernel, float *bias, int s,
              int n, int ic, int h, int w, int oc, int kh, int kw) {

    int oh = (h - kh) / s + 1;
    int ow = (w - kw) / s + 1;
    int o_loop = n * oc * oh * ow;
    float *output = (float *)malloc(sizeof(float) * n * oc * oh * ow);

    // output stationary-like
    for (int oi = 0; oi < o_loop; ++oi) {
        // batch index
        int ni = oi / (oc * oh * ow);
        // channel index
        int oii = (oi / (oh * ow)) % oc;
        // calculate center h,w coordinate of target input
        int hc = (oi / ow) % oh;
        hc *= s;
        int wc = oi % ow;
        wc *= s;
        // iterate kernel
        output[oi] = bias == NULL ? 0 : bias[oii];

        for (int ici = 0; ici < ic; ++ici) {
            for (int hi = 0; hi < kh; ++hi) {
                for (int wi = 0; wi < kw; ++wi) {
                    int hci = hc + hi;
                    int wci = wc + wi;
                    // oii,ici,hi,wi (n,ic,kh,kw)
                    // ni,ici,hc+hi,wc+wi (n,ic,h,w)
                    output[oi] += kernel[oii * ic * kh * kw + ici * kh * kw + hi * kw + wi] * input[ni * ic * h * w + ici * h * w + hci * w + wci];
                }
            }
        }
    }

    return output;
}

void *max_pool2d(float *input, int k, int n, int c, int h, int w, int s) {
    int oh = (h - k) / s + 1;
    int ow = (w - k) / s + 1;

    float *output = (float *)malloc(sizeof(float) * n * c * oh * ow);

    for (int i = 0; i < n * c * oh * ow; ++i) {
        output[i] = -1e5;
        for (int wii = 0; wii < k; ++wii) {
            for (int hii = 0; hii < k; ++hii) {
                // get input index n,c,h,w from output index
                int ni = i / (c * oh * ow);
                int ci = (i / (oh * ow)) % c;
                int hi = (i / ow) % oh;
                hi = hi * s + hii;
                int wi = i % ow;
                wi = wi * s + wii;
                if (input[ni * c * h * w + ci * h * w + hi * w + wi] > output[i])
                    output[i] = input[ni * c * h * w + ci * h * w + hi * w + wi];
            }
        }
    }

    return output;
}

float *pad(float *input, int n, int c, int h, int w, int lpad, int rpad, int tpad, int bpad, float value) {
    int oh = h + tpad + bpad;
    int ow = w + lpad + rpad;

    float *output = (float *)malloc(sizeof(float) * n * c * oh * ow);

    for (int oi = 0; oi < n * c * oh * ow; ++oi) {
        int ni = oi / (c * oh * ow);
        int ci = (oi / (oh * ow)) % c;
        int hi = (oi / ow) % oh;
        int wi = oi % ow;

        if (hi < tpad || hi >= tpad + h || wi < lpad || wi >= lpad + w) {
            output[oi] = value;
        } else {
            int hii = hi - tpad;
            int wii = wi - lpad;
            output[oi] = input[ni * c * h * w + ci * h * w + hii * w + wii];
        }
    }

    return output;
}