---
title: WBTraceTree
menu:
  reference:
    identifier: ko-ref-python-data-types-wbtracetree
---

{{< cta-button githubLink=https://www.github.com/wandb/wandb/tree/637bddf198525810add5804059001b1b319d6ad1/wandb/sdk/data_types/trace_tree.py#L80-L119 >}}

trace tree 데이터를 위한 미디어 오브젝트.

```python
WBTraceTree(
    root_span: Span,
    model_dict: typing.Optional[dict] = None
)
```

| ARG |  |
| :--- | :--- |
| root_span (Span): trace tree의 루트 Span입니다. model_dict (dict, optional): 모델 덤프를 포함하는 사전입니다. 참고: model_dict는 완전히 사용자 정의된 dict입니다. UI는 이 dict에 대한 JSON 뷰어를 렌더링하며 `_kind` 키가 있는 사전을 특별히 처리합니다. 이는 모델 공급업체가 매우 다른 직렬화 형식을 가지고 있기 때문에 여기에서 유연해야 하기 때문입니다. |
