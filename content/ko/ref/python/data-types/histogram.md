---
title: Histogram
menu:
  reference:
    identifier: ko-ref-python-data-types-histogram
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/histogram.py#L18-L94 >}}

히스토그램을 위한 wandb 클래스입니다.

```python
Histogram(
    sequence: Optional[Sequence] = None,
    np_histogram: Optional['NumpyHistogram'] = None,
    num_bins: int = 64
) -> None
```

이 오브젝트는 numpy의 histogram 함수와 똑같이 작동합니다.
https://docs.scipy.org/doc/numpy/reference/generated/numpy.histogram.html

#### 예시:

시퀀스에서 히스토그램 생성

```python
wandb.Histogram([1, 2, 3])
```

np.histogram에서 효율적으로 초기화합니다.

```python
hist = np.histogram(data)
wandb.Histogram(np_histogram=hist)
```

| 인자 |  |
| :--- | :--- |
|  `sequence` |  (array_like) 히스토그램을 위한 입력 데이터 |
|  `np_histogram` |  (numpy histogram) 미리 계산된 히스토그램의 대체 입력 |
|  `num_bins` |  (int) 히스토그램의 bin 개수입니다. 기본 bin 개수는 64개입니다. 최대 bin 개수는 512개입니다. |

| 속성 |  |
| :--- | :--- |
|  `bins` |  ([float]) bin의 경계 |
|  `histogram` |  ([int]) 각 bin에 속하는 요소의 수 |

| 클래스 변수 |  |
| :--- | :--- |
|  `MAX_LENGTH`<a id="MAX_LENGTH"></a> |  `512` |
