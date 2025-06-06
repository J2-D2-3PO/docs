---
description: Track files saved outside the W&B such as in an Amazon S3 bucket, GCS
  bucket, HTTP file server, or even an NFS share.
menu:
  default:
    identifier: track-external-files
    parent: artifacts
title: Track external files
weight: 7
---

Use **reference artifacts** to track files saved outside the W&B system, for example in an Amazon S3 bucket, GCS bucket, Azure blob, HTTP file server, or even an NFS share. Log artifacts outside of a [W&B Run]({{< relref "/ref/python/run" >}}) with the W&B [CLI]({{< relref "/ref/cli" >}}).

### Log artifacts outside of runs

W&B creates a run when you log an artifact outside of a run. Each artifact belongs to a run, which in turn belongs to a project. An artifact (version) also belongs to a collection, and has a type.

Use the [`wandb artifact put`]({{< relref "/ref/cli/wandb-artifact/wandb-artifact-put" >}}) command to upload an artifact to the W&B server outside of a W&B run. Provide the name of the project you want the artifact to belong to along with the name of the artifact (`project/artifact_name`).Optionally provide the type (`TYPE`). Replace `PATH` in the code snippet below with the file path of the artifact you want to upload.

```bash
$ wandb artifact put --name project/artifact_name --type TYPE PATH
```

W&B will create a new project if a the project you specify does not exist. For information on how to download an artifact, see [Download and use artifacts]({{< relref "/guides/core/artifacts/download-and-use-an-artifact" >}}).

## Track artifacts outside of W&B

Use W&B Artifacts for dataset versioning and model lineage, and use **reference artifacts** to track files saved outside the W&B server. In this mode an artifact only stores metadata about the files, such as URLs, size, and checksums. The underlying data never leaves your system. See the [Quick start]({{< relref "/guides/core/artifacts/artifacts-walkthrough" >}}) for information on how to save files and directories to W&B servers instead.

The following describes how to construct reference artifacts and how to best incorporate them into your workflows.

### Amazon S3 / GCS / Azure Blob Storage References

Use W&B Artifacts for dataset and model versioning to track references in cloud storage buckets. With artifact references, seamlessly layer tracking on top of your buckets with no modifications to your existing storage layout.


Artifacts abstract away the underlying cloud storage vendor (such AWS, GCP or Azure). Information described in the proceeding section apply uniformly to Amazon S3, Google Cloud Storage and Azure Blob Storage.

{{% alert %}}
W&B Artifacts support any Amazon S3 compatible interface, including MinIO. The scripts below work as-is, when you set the `AWS_S3_ENDPOINT_URL` environment variable to point at your MinIO server.
{{% /alert %}}

Assume we have a bucket with the following structure:

```bash
s3://my-bucket
+-- datasets/
|		+-- mnist/
+-- models/
		+-- cnn/
```

Under `mnist/` we have our dataset, a collection of images. Lets track it with an artifact:

```python
import wandb

run = wandb.init()
artifact = wandb.Artifact("mnist", type="dataset")
artifact.add_reference("s3://my-bucket/datasets/mnist")
run.log_artifact(artifact)
```
{{% alert color="secondary" %}}
By default, W&B imposes a 10,000 object limit when adding an object prefix. You can adjust this limit by specifying `max_objects=` in calls to `add_reference`.
{{% /alert %}}

Our new reference artifact `mnist:latest` looks and behaves similarly to a regular artifact. The only difference is that the artifact only consists of metadata about the S3/GCS/Azure object such as its ETag, size, and version ID (if object versioning is enabled on the bucket).

W&B will use the default mechanism to look for credentials based on the cloud provider you use. Read the documentation from your cloud provider to learn more about the credentials used:

| Cloud provider | Credentials Documentation |
| -------------- | ------------------------- |
| AWS            | [Boto3 documentation](https://boto3.amazonaws.com/v1/documentation/api/latest/guide/credentials.html#configuring-credentials) |
| GCP            | [Google Cloud documentation](https://cloud.google.com/docs/authentication/provide-credentials-adc) |
| Azure          | [Azure documentation](https://learn.microsoft.com/python/api/azure-identity/azure.identity.defaultazurecredential?view=azure-python) |

For AWS, if the bucket is not located in the configured user's default region, you must set the `AWS_REGION` environment variable to match the bucket region.

Interact with this artifact similarly to a normal artifact. In the App UI, you can look through the contents of the reference artifact using the file browser, explore the full dependency graph, and scan through the versioned history of your artifact.

{{% alert color="secondary" %}}
Rich media such as images, audio, video, and point clouds may fail to render in the App UI depending on the CORS configuration of your bucket. Allow listing **app.wandb.ai** in your bucket's CORS settings will allow the App UI to properly render such rich media.

Panels might fail to render in the App UI for private buckets. If your company has a VPN, you could update your bucket's access policy to whitelist IPs within your VPN.
{{% /alert %}}

### Download a reference artifact

```python
import wandb

run = wandb.init()
artifact = run.use_artifact("mnist:latest", type="dataset")
artifact_dir = artifact.download()
```

W&B will use the metadata recorded when the artifact was logged to retrieve the files from the underlying bucket when it downloads a reference artifact. If your bucket has object versioning enabled, W&B will retrieve the object version corresponding to the state of the file at the time an artifact was logged. This means that as you evolve the contents of your bucket, you can still point to the exact iteration of your data a given model was trained on since the artifact serves as a snapshot of your bucket at the time of training.

{{% alert %}}
W&B recommends that you enable 'Object Versioning' on your storage buckets if you overwrite files as part of your workflow. With versioning enabled on your buckets, artifacts with references to files that have been overwritten will still be intact because the older object versions are retained. 

Based on your use case, read the instructions to enable object versioning: [AWS](https://docs.aws.amazon.com/AmazonS3/latest/userguide/manage-versioning-examples.html), [GCP](https://cloud.google.com/storage/docs/using-object-versioning#set), [Azure](https://learn.microsoft.com/azure/storage/blobs/versioning-enable).
{{% /alert %}}

### Tying it together

The following code example demonstrates a simple workflow you can use to track a dataset in Amazon S3, GCS, or Azure that feeds into a training job:

```python
import wandb

run = wandb.init()

artifact = wandb.Artifact("mnist", type="dataset")
artifact.add_reference("s3://my-bucket/datasets/mnist")

# Track the artifact and mark it as an input to
# this run in one swoop. A new artifact version
# is only logged if the files in the bucket changed.
run.use_artifact(artifact)

artifact_dir = artifact.download()

# Perform training here...
```

To track models, we can log the model artifact after the training script uploads the model files to the bucket:

```python
import boto3
import wandb

run = wandb.init()

# Training here...

s3_client = boto3.client("s3")
s3_client.upload_file("my_model.h5", "my-bucket", "models/cnn/my_model.h5")

model_artifact = wandb.Artifact("cnn", type="model")
model_artifact.add_reference("s3://my-bucket/models/cnn/")
run.log_artifact(model_artifact)
```

{{% alert %}}
Read through the following reports for an end-to-end walkthrough of how to track artifacts by reference for GCP or Azure:

* [Guide to Tracking Artifacts by Reference](https://wandb.ai/stacey/artifacts/reports/Tracking-Artifacts-by-Reference--Vmlldzo1NDMwOTE)
* [Working with Reference Artifacts in Microsoft Azure](https://wandb.ai/andrea0/azure-2023/reports/Efficiently-Harnessing-Microsoft-Azure-Blob-Storage-with-Weights-Biases--Vmlldzo0NDA2NDgw)
{{% /alert %}}

### Filesystem References

Another common pattern for fast access to datasets is to expose an NFS mount point to a remote filesystem on all machines running training jobs. This can be an even simpler solution than a cloud storage bucket because from the perspective of the training script, the files look just like they are sitting on your local filesystem. Luckily, that ease of use extends into using Artifacts to track references to file systems, whether they are mounted or not.

Assume we have a filesystem mounted at `/mount` with the following structure:

```bash
mount
+-- datasets/
|		+-- mnist/
+-- models/
		+-- cnn/
```

Under `mnist/` we have our dataset, a collection of images. Let's track it with an artifact:

```python
import wandb

run = wandb.init()
artifact = wandb.Artifact("mnist", type="dataset")
artifact.add_reference("file:///mount/datasets/mnist/")
run.log_artifact(artifact)
```

By default, W&B imposes a 10,000 file limit when adding a reference to a directory. You can adjust this limit by specifying `max_objects=` in calls to `add_reference`.

Note the triple slash in the URL. The first component is the `file://` prefix that denotes the use of filesystem references. The second is the path to our dataset, `/mount/datasets/mnist/`.

The resulting artifact `mnist:latest` looks and acts just like a regular artifact. The only difference is that the artifact only consists of metadata about the files, such as their sizes and MD5 checksums. The files themselves never leave your system.

You can interact with this artifact just as you would a normal artifact. In the UI, you can browse the contents of the reference artifact using the file browser, explore the full dependency graph, and scan through the versioned history of your artifact. However, the UI will not be able to render rich media such as images, audio, etc. as the data itself is not contained within the artifact.

Downloading a reference artifact is simple:

```python
import wandb

run = wandb.init()
artifact = run.use_artifact("entity/project/mnist:latest", type="dataset")
artifact_dir = artifact.download()
```

For filesystem references, a `download()` operation copies the files from the referenced paths to construct the artifact directory. In the above example, the contents of `/mount/datasets/mnist` will be copied into the directory `artifacts/mnist:v0/`. If an artifact contains a reference to a file that was overwritten, then `download()` will throw an error as the artifact can no longer be reconstructed.

Putting everything together, here's a simple workflow you can use to track a dataset under a mounted filesystem that feeds into a training job:

```python
import wandb

run = wandb.init()

artifact = wandb.Artifact("mnist", type="dataset")
artifact.add_reference("file:///mount/datasets/mnist/")

# Track the artifact and mark it as an input to
# this run in one swoop. A new artifact version
# is only logged if the files under the directory
# changed.
run.use_artifact(artifact)

artifact_dir = artifact.download()

# Perform training here...
```

To track models, we can log the model artifact after the training script writes the model files to the mount point:

```python
import wandb

run = wandb.init()

# Training here...

# Write model to disk

model_artifact = wandb.Artifact("cnn", type="model")
model_artifact.add_reference("file:///mount/cnn/my_model.h5")
run.log_artifact(model_artifact)
```