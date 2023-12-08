#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define ALPHA 0.01

void c_free(void *ptr)
{
    free(ptr);
}

// TODOs
// implement a simple C functions whose functionality complies with restricted PyTorch functions
float *leaky_relu(float *activation, int *shape, float negative_slope)
{
    int h = shape[0];
    int w = shape[1];
    float *result = malloc(sizeof(float) * h * w);
    for (int k = 0; k < h; k++)
    {
        for (int l = 0; l < w; l++)
        {
            int index = k * w + l;
            float tar = activation[index];
            result[index] = tar >= 0 ? tar : tar * negative_slope;
        }
    }
    return result;
}

float *batch_norm(float *activation, int *shape, float *running_mean, float *runninig_var, float *weight, float *bias)
{
    int N = shape[0];
    int c = shape[1];
    int h = shape[2];
    int w = shape[3];
    float *result = malloc(sizeof(float) * N * c * h * w);
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < c; j++)
        {
            for (int k = 0; k < h; k++)
            {
                for (int l = 0; l < w; l++)
                {
                    int index = i * c * h * w + j * h * w + k * w + l;
                    result[index] = (activation[index] - running_mean[j]) / (sqrt(runninig_var[j] + 1e-5)) * weight[j] + bias[j];
                }
            }
        }
    }
    return result;
}

float *conv2d(float *activation, int *shape, float *weight, int *shape_weight, float *bias, int stride)
{
    int N = shape[0];
    int ic = shape[1];
    int h = shape[2];
    int w = shape[3];
    int oc = shape_weight[0];
    int kh = shape_weight[2];
    int kw = shape_weight[3];

    int oh = (h - kh) / stride + 1;
    int ow = (w - kw) / stride + 1;
    float *result = malloc(sizeof(float) * N * oc * oh * ow);
    // printf("size of result: %d\n", N * oc * oh * ow);
    // printf("pointer for bias: %p\n", bias);

    for (int i = 0; i < N; i++)
    {
        for (int fid = 0; fid < oc; fid++)
        {
            for (int j = 0; j < oh; j++)
            {
                for (int k = 0; k < ow; k++)
                {
                    int index = i * oc * oh * ow + fid * oh * ow + j * ow + k;
                    result[index] = bias ? bias[fid] : 0;
                }
            }

            for (int j = 0; j < ic; j++)
            {
                for (int k = 0; k < h - kh + 1; k += stride)
                {
                    for (int l = 0; l < w - kw + 1; l += stride)
                    {
                        int result_index = i * oc * oh * ow + fid * oh * ow + (k / stride) * ow + (l / stride);
                        // printf("result_index: %d\n", result_index);
                        int input_index = i * ic * h * w + j * h * w + k * w + l;
                        for (int p = 0; p < kh; p++)
                        {
                            for (int q = 0; q < kw; q++)
                            {
                                result[result_index] += activation[input_index + p * w + q] * weight[fid * ic * kh * kw + j * kh * kw + p * kw + q];
                            }
                        }
                    }
                }
            }
        }
    }
    return result;
}

void *max_pool2d(float *activation, int *shape, int kernel, int stride)
{
    int N = shape[0];
    int c = shape[1];
    int h = shape[2];
    int w = shape[3];
    int oh = (h - kernel) / stride + 1;
    int ow = (w - kernel) / stride + 1;
    float *result = malloc(sizeof(float) * N * c * oh * ow);
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < c; j++)
        {
            for (int k = 0; k < h - kernel + 1; k += stride)
            {
                for (int l = 0; l < w - kernel + 1; l += stride)
                {
                    int result_index = i * c * oh * ow + j * oh * ow + (k / stride) * ow + (l / stride);
                    int activation_pivot = i * c * h * w + j * h * w + k * w + l;
                    float max = activation[activation_pivot];
                    for (int p = 0; p < kernel; p++)
                    {
                        for (int q = 0; q < kernel; q++)
                        {
                            int activation_index = activation_pivot + p * w + q;
                            if (max < activation[activation_index])
                            {
                                max = activation[activation_index];
                            }
                        }
                    }
                    result[result_index] = max;
                }
            }
        }
    }
    return result;
}

float *pad(float *activation, int *shape, int *pad, float value)
{
    int N = shape[0];
    int c = shape[1];
    int h = shape[2];
    int w = shape[3];
    int left = pad[0];
    int right = pad[1];
    int top = pad[2];
    int bottom = pad[3];
    int oh = h + top + bottom;
    int ow = w + left + right;
    float *result = malloc(sizeof(float) * N * c * oh * ow);
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < c; j++)
        {
            for (int k = 0; k < oh; k++)
            {
                for (int l = 0; l < ow; l++)
                {
                    int result_index = i * c * oh * ow + j * oh * ow + k * ow + l;
                    result[result_index] = value;
                }
            }
        }
    }
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < c; j++)
        {
            for (int k = 0; k < h; k++)
            {
                for (int l = 0; l < w; l++)
                {
                    int activation_index = i * c * h * w + j * h * w + k * w + l;
                    int result_index = i * c * oh * ow + j * oh * ow + (k + top) * ow + (l + left);
                    result[result_index] = activation[activation_index];
                }
            }
        }
    }
    return result;
}
