---
title: agent
menu:
  reference:
    identifier: ko-ref-python-agent
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/wandb_agent.py#L532-L576 >}}

하나 이상의 스윕 에이전트를 시작합니다.

```python
agent(
    sweep_id: str,
    function: Optional[Callable] = None,
    entity: Optional[str] = None,
    project: Optional[str] = None,
    count: Optional[int] = None
) -> None
```

스윕 에이전트는 `sweep_id` 를 사용하여 어떤 스윕의 일부인지, 어떤 함수를 실행해야 하는지, 그리고 (선택적으로) 실행할 에이전트 수를 파악합니다.

| Args |  |
| :--- | :--- |
|  `sweep_id` | 스윕의 고유 식별자입니다. 스윕 ID는 W&B CLI 또는 Python SDK에 의해 생성됩니다. |
|  `function` | 스윕 구성에 지정된 "program" 대신 호출할 함수입니다. |
|  `entity` | 스윕에 의해 생성된 W&B run을 보낼 사용자 이름 또는 팀 이름입니다. 지정한 엔터티가 이미 존재하는지 확인하십시오. 엔터티를 지정하지 않으면 run은 기본 엔터티 (일반적으로 사용자 이름)로 전송됩니다. |
|  `project` | 스윕에서 생성된 W&B run이 전송되는 프로젝트의 이름입니다. 프로젝트가 지정되지 않은 경우 run은 "Uncategorized"라는 프로젝트로 전송됩니다. |
|  `count` | 시도할 스윕 구성 트라이얼 수입니다. |
