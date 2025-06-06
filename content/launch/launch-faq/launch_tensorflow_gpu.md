---
menu:
  launch:
    identifier: launch_tensorflow_gpu
    parent: launch-faq
title: How do I make W&B Launch work with Tensorflow on GPU?
---

For TensorFlow jobs using GPUs, specify a custom base image for the container build. This ensures proper GPU utilization during runs. Add an image tag under the `builder.accelerator.base_image` key in the resource configuration. For example:

```json
{
    "gpus": "all",
    "builder": {
        "accelerator": {
            "base_image": "tensorflow/tensorflow:latest-gpu"
        }
    }
}
```

In versions prior to W&B 0.15.6, use `cuda` instead of `accelerator` as the parent key for `base_image`.