---
title: LaunchAgent
menu:
  reference:
    identifier: ko-ref-python-launch-library-launchagent
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L164-L924 >}}

run 큐를 폴링하고 wandb Launch에 대한 run을 시작하는 Launch 에이전트 클래스입니다.

```python
LaunchAgent(
    api: Api,
    config: Dict[str, Any]
)
```

| 인수 |  |
| :--- | :--- |
|  `api` | 백엔드에 요청을 보내는 데 사용할 Api 오브젝트입니다. |
|  `config` | 에이전트의 구성 사전입니다. |

| 속성 |  |
| :--- | :--- |
|  `num_running_jobs` | 스케줄러를 포함하지 않는 작업 수를 반환합니다. |
|  `num_running_schedulers` | 스케줄러 수만 반환합니다. |
|  `thread_ids` | 에이전트에 대해 실행 중인 스레드 ID의 키 목록을 반환합니다. |

## 메소드

### `check_sweep_state`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L786-L803)

```python
check_sweep_state(
    launch_spec, api
)
```

스윕에 대한 run을 시작하기 전에 스윕의 상태를 확인합니다.

### `fail_run_queue_item`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L295-L304)

```python
fail_run_queue_item(
    run_queue_item_id, message, phase, files=None
)
```

### `finish_thread_id`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L416-L509)

```python
finish_thread_id(
    thread_id, exception=None
)
```

현재 작업 목록에서 작업을 제거합니다.

### `get_job_and_queue`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L908-L915)

```python
get_job_and_queue()
```

### `initialized`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L190-L193)

```python
@classmethod
initialized() -> bool
```

에이전트가 초기화되었는지 여부를 반환합니다.

### `loop`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L572-L653)

```python
loop()
```

작업을 폴링하고 실행하기 위해 무한 루프합니다.

| 예외 |  |
| :--- | :--- |
|  `KeyboardInterrupt` | 에이전트가 중지 요청을 받은 경우 발생합니다. |

### `name`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L180-L188)

```python
@classmethod
name() -> str
```

에이전트의 이름을 반환합니다.

### `pop_from_queue`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L340-L363)

```python
pop_from_queue(
    queue
)
```

runqueue에서 항목을 팝하여 작업으로 실행합니다.

| 인수 |  |
| :--- | :--- |
|  `queue` | 팝할 큐입니다. |

| 반환 값 |  |
| :--- | :--- |
|  큐에서 팝된 항목입니다. |

| 예외 |  |
| :--- | :--- |
|  `Exception` | 큐에서 팝하는 동안 오류가 발생한 경우 발생합니다. |

### `print_status`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L365-L381)

```python
print_status() -> None
```

에이전트의 현재 상태를 출력합니다.

### `run_job`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L511-L541)

```python
run_job(
    job, queue, file_saver
)
```

프로젝트를 설정하고 작업을 실행합니다.

| 인수 |  |
| :--- | :--- |
|  `job` | 실행할 작업입니다. |

### `task_run_job`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L656-L688)

```python
task_run_job(
    launch_spec, job, default_config, api, job_tracker
)
```

### `update_status`

[소스 보기](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/launch/agent/agent.py#L383-L394)

```python
update_status(
    status
)
```

에이전트의 상태를 업데이트합니다.

| 인수 |  |
| :--- | :--- |
|  `status` | 에이전트를 업데이트할 상태입니다. |
