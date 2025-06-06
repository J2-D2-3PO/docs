---
title: Object3D
menu:
  reference:
    identifier: ko-ref-python-data-types-object3d
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/object_3d.py#L186-L462 >}}

3D 포인트 클라우드를 위한 Wandb 클래스입니다.

```python
Object3D(
    data_or_path: Union['np.ndarray', str, 'TextIO', dict],
    **kwargs
) -> None
```

| Args |  |
| :--- | :--- |
|  `data_or_path` |  (numpy array, string, io) Object3D는 파일 또는 numpy array에서 초기화할 수 있습니다. 파일 또는 io 오브젝트에 대한 경로와 SUPPORTED_TYPES 중 하나여야 하는 file_type을 전달할 수 있습니다. |

numpy array의 모양은 다음 중 하나여야 합니다.

```
[[x y z],       ...] nx3
[[x y z c],     ...] nx4 여기서 c는 지원되는 범위 [1, 14]의 카테고리입니다.
[[x y z r g b], ...] nx6 여기서 rgb는 색상입니다.
```

## Methods

### `from_file`

[View source](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/object_3d.py#L332-L349)

```python
@classmethod
from_file(
    data_or_path: Union['TextIO', str],
    file_type: Optional['FileFormat3D'] = None
) -> "Object3D"
```

파일 또는 스트림에서 Object3D를 초기화합니다.

| Args |  |
| :--- | :--- |
|  data_or_path (Union["TextIO", str]): 파일 또는 `TextIO` 스트림에 대한 경로입니다. file_type (str): `data_or_path`에 전달된 데이터 형식을 지정합니다. `data_or_path`가 `TextIO` 스트림인 경우 필수입니다. 파일 경로가 제공되면 이 파라미터는 무시됩니다. 유형은 파일 확장명에서 가져옵니다. |

### `from_numpy`

[View source](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/object_3d.py#L351-L380)

```python
@classmethod
from_numpy(
    data: "np.ndarray"
) -> "Object3D"
```

numpy array에서 Object3D를 초기화합니다.

| Args |  |
| :--- | :--- |
|  data (numpy array): array의 각 항목은 포인트 클라우드의 한 점을 나타냅니다. |

numpy array의 모양은 다음 중 하나여야 합니다.

```
[[x y z],       ...]  # nx3.
[[x y z c],     ...]  # nx4 여기서 c는 지원되는 범위 [1, 14]의 카테고리입니다.
[[x y z r g b], ...]  # nx6 여기서 rgb는 색상입니다.
```

### `from_point_cloud`

[View source](https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/object_3d.py#L382-L416)

```python
@classmethod
from_point_cloud(
    points: Sequence['Point'],
    boxes: Sequence['Box3D'],
    vectors: Optional[Sequence['Vector3D']] = None,
    point_cloud_type: "PointCloudType" = "lidar/beta"
) -> "Object3D"
```

python 오브젝트에서 Object3D를 초기화합니다.

| Args |  |
| :--- | :--- |
|  points (Sequence["Point"]): 포인트 클라우드의 점입니다. boxes (Sequence["Box3D"]): 포인트 클라우드를 레이블링하기 위한 3D 경계 상자입니다. 상자는 포인트 클라우드 시각화에 표시됩니다. vectors (Optional[Sequence["Vector3D"]]): 각 벡터는 포인트 클라우드 시각화에 표시됩니다. 경계 상자의 방향성을 나타내는 데 사용할 수 있습니다. 기본값은 None입니다. point_cloud_type ("lidar/beta"): 현재 "lidar/beta" 유형만 지원됩니다. 기본값은 "lidar/beta"입니다. |

| Class Variables |  |
| :--- | :--- |
|  `SUPPORTED_POINT_CLOUD_TYPES`<a id="SUPPORTED_POINT_CLOUD_TYPES"></a> |   |
|  `SUPPORTED_TYPES`<a id="SUPPORTED_TYPES"></a> |   |
