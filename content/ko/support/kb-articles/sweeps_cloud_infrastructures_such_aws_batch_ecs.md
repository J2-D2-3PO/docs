---
title: Can you use W&B Sweeps with cloud infrastructures such as AWS Batch, ECS, etc.?
menu:
  support:
    identifier: ko-support-kb-articles-sweeps_cloud_infrastructures_such_aws_batch_ecs
support:
- sweeps
- aws
toc_hide: true
type: docs
url: /ko/support/:filename
---

모든 W&B Sweep 에이전트가 엑세스할 수 있도록 `sweep_id`를 게시하려면, 이러한 에이전트가 `sweep_id`를 읽고 실행할 수 있는 메소드 를 구현하세요.

예를 들어 Amazon EC2 인스턴스를 시작하고 그 위에서 `wandb agent`를 실행합니다. SQS 대기열을 사용하여 `sweep_id`를 여러 EC2 인스턴스에 브로드캐스트합니다. 그러면 각 인스턴스는 대기열에서 `sweep_id`를 검색하여 프로세스 를 시작할 수 있습니다.
