---
description: How to integrate W&B with the Transformers library by Hugging Face.
menu:
  default:
    identifier: simpletransformers
    parent: integrations
title: Simple Transformers
weight: 390
---

This library is based on the Transformers library by Hugging Face. Simple Transformers lets you quickly train and evaluate Transformer models. Only 3 lines of code are needed to initialize a model, train the model, and evaluate a model. It supports Sequence Classification, Token Classification \(NER\),Question Answering,Language Model Fine-Tuning, Language Model Training, Language Generation, T5 Model, Seq2Seq Tasks , Multi-Modal Classification and Conversational AI.

To use Weights and Biases for visualizing model training. To use this, set a project name for W&B in the `wandb_project` attribute of the `args` dictionary. This logs all hyperparameter values, training losses, and evaluation metrics to the given project.

```python
model = ClassificationModel('roberta', 'roberta-base', args={'wandb_project': 'project-name'})
```

Any additional arguments that go into `wandb.init` can be passed as `wandb_kwargs`.

## Structure

The library is designed to have a separate class for every NLP task. The classes that provide similar functionality are grouped together.

* `simpletransformers.classification` - Includes all Classification models.
  * `ClassificationModel`
  * `MultiLabelClassificationModel`
* `simpletransformers.ner` - Includes all Named Entity Recognition models.
  * `NERModel`
* `simpletransformers.question_answering` - Includes all Question Answering models.
  * `QuestionAnsweringModel`

Here are some minimal examples

## MultiLabel Classification

```text
  model = MultiLabelClassificationModel("distilbert","distilbert-base-uncased",num_labels=6,
    args={"reprocess_input_data": True, "overwrite_output_dir": True, "num_train_epochs":epochs,'learning_rate':learning_rate,
                'wandb_project': "simpletransformers"},
  )
   # Train the model
  model.train_model(train_df)

  # Evaluate the model
  result, model_outputs, wrong_predictions = model.eval_model(eval_df)
```

## Question Answering

```text
  train_args = {
    'learning_rate': wandb.config.learning_rate,
    'num_train_epochs': 2,
    'max_seq_length': 128,
    'doc_stride': 64,
    'overwrite_output_dir': True,
    'reprocess_input_data': False,
    'train_batch_size': 2,
    'fp16': False,
    'wandb_project': "simpletransformers"
}

model = QuestionAnsweringModel('distilbert', 'distilbert-base-cased', args=train_args)
model.train_model(train_data)
```


SimpleTransformers provides classes as well as training scripts for all common natural language tasks. Here is the complete list of global arguments that are supported by the library, with their default arguments.

```text
global_args = {
  "adam_epsilon": 1e-8,
  "best_model_dir": "outputs/best_model",
  "cache_dir": "cache_dir/",
  "config": {},
  "do_lower_case": False,
  "early_stopping_consider_epochs": False,
  "early_stopping_delta": 0,
  "early_stopping_metric": "eval_loss",
  "early_stopping_metric_minimize": True,
  "early_stopping_patience": 3,
  "encoding": None,
  "eval_batch_size": 8,
  "evaluate_during_training": False,
  "evaluate_during_training_silent": True,
  "evaluate_during_training_steps": 2000,
  "evaluate_during_training_verbose": False,
  "fp16": True,
  "fp16_opt_level": "O1",
  "gradient_accumulation_steps": 1,
  "learning_rate": 4e-5,
  "local_rank": -1,
  "logging_steps": 50,
  "manual_seed": None,
  "max_grad_norm": 1.0,
  "max_seq_length": 128,
  "multiprocessing_chunksize": 500,
  "n_gpu": 1,
  "no_cache": False,
  "no_save": False,
  "num_train_epochs": 1,
  "output_dir": "outputs/",
  "overwrite_output_dir": False,
  "process_count": cpu_count() - 2 if cpu_count() > 2 else 1,
  "reprocess_input_data": True,
  "save_best_model": True,
  "save_eval_checkpoints": True,
  "save_model_every_epoch": True,
  "save_steps": 2000,
  "save_optimizer_and_scheduler": True,
  "silent": False,
  "tensorboard_dir": None,
  "train_batch_size": 8,
  "use_cached_eval_features": False,
  "use_early_stopping": False,
  "use_multiprocessing": True,
  "wandb_kwargs": {},
  "wandb_project": None,
  "warmup_ratio": 0.06,
  "warmup_steps": 0,
  "weight_decay": 0,
}
```

Refer to [simpletransformers on github](https://github.com/ThilinaRajapakse/simpletransformers) for more detailed documentation.

Checkout [this Weights and Biases report](https://app.wandb.ai/cayush/simpletransformers/reports/Using-simpleTransformer-on-common-NLP-applications---Vmlldzo4Njk2NA) that covers training transformers on some the most popular GLUE benchmark datasets. [Try it out yourself on colab](https://colab.research.google.com/drive/1oXROllqMqVvBFcPgTKJRboTq96uWuqSz?usp=sharing).