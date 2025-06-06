---
title: Reports
menu:
  reference:
    identifier: ko-ref-python-wandb_workspaces-reports
---

{{< cta-button githubLink="https://github.com/wandb/wandb-workspaces/blob/main/wandb_workspaces/reports/v2/interface.py" >}}






# <kbd>module</kbd> `wandb_workspaces.reports.v2`
W&B Reports API를 프로그래밍 방식으로 사용하기 위한 Python 라이브러리입니다.

```python
import wandb_workspaces.reports.v2 as wr

report = wr.Report(
     entity="entity",
     project="project",
     title="An amazing title",
     description="A descriptive description.",
)

blocks = [
     wr.PanelGrid(
         panels=[
             wr.LinePlot(x="time", y="velocity"),
             wr.ScatterPlot(x="time", y="acceleration"),
         ]
     )
]

report.blocks = blocks
report.save()
```

---



## <kbd>class</kbd> `BarPlot`
2D 막대 그래프를 표시하는 패널 오브젝트입니다.

**Attributes:**
 
 - `title` (Optional[str]): 플롯 상단에 표시되는 텍스트입니다.
 - `metrics` (LList[MetricType]): orientation Literal["v", "h"]: 막대 그래프의 방향입니다. 수직("v") 또는 수평("h")으로 설정합니다. 기본값은 수평("h")입니다.
 - `range_x` (Tuple[float | None, float | None]): x축의 범위를 지정하는 튜플입니다.
 - `title_x` (Optional[str]): x축의 레이블입니다.
 - `title_y` (Optional[str]): y축의 레이블입니다.
 - `groupby` (Optional[str]): 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 메트릭을 기반으로 run을 그룹화합니다.
 - `groupby_aggfunc` (Optional[GroupAgg]): 지정된 함수로 run을 집계합니다. 옵션에는 `mean`, `min`, `max`, `median`, `sum`, `samples` 또는 `None`이 있습니다.
 - `groupby_rangefunc` (Optional[GroupArea]): 범위를 기준으로 run을 그룹화합니다. 옵션에는 `minmax`, `stddev`, `stderr`, `none`, =`samples` 또는 `None`이 있습니다.
 - `max_runs_to_show` (Optional[int]): 플롯에 표시할 최대 run 수입니다.
 - `max_bars_to_show` (Optional[int]): 막대 그래프에 표시할 최대 막대 수입니다.
 - `custom_expressions` (Optional[LList[str]]): 막대 그래프에 사용할 사용자 정의 표현식 목록입니다.
 - `legend_template` (Optional[str]): 범례 템플릿입니다.
 - `font_size` ( Optional[FontSize]): 선 플롯 글꼴 크기입니다. 옵션에는 `small`, `medium`, `large`, `auto` 또는 `None`이 있습니다.
 - `line_titles` (Optional[dict]): 선 제목입니다. 키는 선 이름이고 값은 제목입니다.
 - `line_colors` (Optional[dict]): 선 색상입니다. 키는 선 이름이고 값은 색상입니다.

---

## <kbd>class</kbd> `BlockQuote`
인용된 텍스트 블록입니다.

**Attributes:**
 
 - `text` (str): 인용 블록의 텍스트입니다.

---

## <kbd>class</kbd> `CalloutBlock`
콜아웃 텍스트 블록입니다.

**Attributes:**
 
 - `text` (str): 콜아웃 텍스트입니다.

---

## <kbd>class</kbd> `CheckedList`
확인란이 있는 항목 목록입니다. `CheckedList` 내에 하나 이상의 `CheckedListItem`을 추가합니다.

**Attributes:**
 
 - `items` (LList[CheckedListItem]): 하나 이상의 `CheckedListItem` 오브젝트 목록입니다.

---

## <kbd>class</kbd> `CheckedListItem`
확인란이 있는 목록 항목입니다. `CheckedList` 내에 하나 이상의 `CheckedListItem`을 추가합니다.

**Attributes:**
 
 - `text` (str): 목록 항목의 텍스트입니다.
 - `checked` (bool): 확인란이 선택되었는지 여부입니다. 기본적으로 `False`로 설정됩니다.

---

## <kbd>class</kbd> `CodeBlock`
코드 블록입니다.

**Attributes:**
 
 - `code` (str): 블록의 코드입니다.
 - `language` (Optional[Language]): 코드의 언어입니다. 지정된 언어는 구문 강조 표시에 사용됩니다. 기본적으로 `python`으로 설정됩니다. 옵션에는 `javascript`, `python`, `css`, `json`, `html`, `markdown`, `yaml`이 있습니다.

---

## <kbd>class</kbd> `CodeComparer`
두 개의 다른 run 간의 코드를 비교하는 패널 오브젝트입니다.

**Attributes:**
 
 - `diff` `(Literal['split', 'unified'])`: 코드 차이점을 표시하는 방법입니다. 옵션에는 `split` 및 `unified`가 있습니다.

---

## <kbd>class</kbd> `Config`
run의 config 오브젝트에 기록된 메트릭입니다. Config 오브젝트는 일반적으로 `run.config[name] = ...`을 사용하거나 키-값 쌍의 사전으로 config를 전달하여 기록됩니다. 여기서 키는 메트릭 이름이고 값은 해당 메트릭 값입니다.

**Attributes:**
 
 - `name` (str): 메트릭 이름입니다.

---

## <kbd>class</kbd> `CustomChart`
사용자 정의 차트를 표시하는 패널입니다. 차트는 Weave 쿼리로 정의됩니다.

**Attributes:**
 
 - `query` (dict): 사용자 정의 차트를 정의하는 쿼리입니다. 키는 필드 이름이고 값은 쿼리입니다.
 - `chart_name` (str): 사용자 정의 차트 제목입니다.
 - `chart_fields` (dict): 플롯의 축을 정의하는 키-값 쌍입니다. 여기서 키는 레이블이고 값은 메트릭입니다.
 - `chart_strings` (dict): 차트의 문자열을 정의하는 키-값 쌍입니다.

---

### <kbd>classmethod</kbd> `from_table`

```python
from_table(
    table_name: str,
    chart_fields: dict = None,
    chart_strings: dict = None
)
```

테이블에서 사용자 정의 차트를 만듭니다.

**Arguments:**
 
 - `table_name` (str): 테이블 이름입니다.
 - `chart_fields` (dict): 차트에 표시할 필드입니다.
 - `chart_strings` (dict): 차트에 표시할 문자열입니다.

---

## <kbd>class</kbd> `Gallery`
Reports 및 URL 갤러리를 렌더링하는 블록입니다.

**Attributes:**
 
 - `items` (List[Union[`GalleryReport`, `GalleryURL`]]): `GalleryReport` 및 `GalleryURL` 오브젝트 목록입니다.

---

## <kbd>class</kbd> `GalleryReport`
갤러리의 리포트에 대한 참조입니다.

**Attributes:**
 
 - `report_id` (str): 리포트 ID입니다.

---

## <kbd>class</kbd> `GalleryURL`
외부 리소스에 대한 URL입니다.

**Attributes:**
 
 - `url` (str): 리소스의 URL입니다.
 - `title` (Optional[str]): 리소스 제목입니다.
 - `description` (Optional[str]): 리소스 설명입니다.
 - `image_url` (Optional[str]): 표시할 이미지 URL입니다.

---

## <kbd>class</kbd> `GradientPoint`
그레이디언트의 점입니다.

**Attributes:**
 
 - `color`: 점의 색상입니다.
 - `offset`: 그레이디언트에서 점의 위치입니다. 값은 0에서 100 사이여야 합니다.

---

## <kbd>class</kbd> `H1`
지정된 텍스트가 있는 H1 제목입니다.

**Attributes:**
 
 - `text` (str): 제목의 텍스트입니다.
 - `collapsed_blocks` (Optional[LList["BlockTypes"]]): 제목이 축소될 때 표시할 블록입니다.

---

## <kbd>class</kbd> `H2`
지정된 텍스트가 있는 H2 제목입니다.

**Attributes:**
 
 - `text` (str): 제목의 텍스트입니다.
 - `collapsed_blocks` (Optional[LList["BlockTypes"]]): 제목이 축소될 때 표시할 하나 이상의 블록입니다.

---

## <kbd>class</kbd> `H3`
지정된 텍스트가 있는 H3 제목입니다.

**Attributes:**
 
 - `text` (str): 제목의 텍스트입니다.
 - `collapsed_blocks` (Optional[LList["BlockTypes"]]): 제목이 축소될 때 표시할 하나 이상의 블록입니다.

---

## <kbd>class</kbd> `Heading`

---

## <kbd>class</kbd> `HorizontalRule`
HTML 수평선입니다.

---

## <kbd>class</kbd> `Image`
이미지를 렌더링하는 블록입니다.

**Attributes:**
 
 - `url` (str): 이미지 URL입니다.
 - `caption` (str): 이미지 캡션입니다. 캡션은 이미지 아래에 나타납니다.

---

## <kbd>class</kbd> `InlineCode`
인라인 코드입니다. 코드 뒤에 줄 바꿈 문자를 추가하지 않습니다.

**Attributes:**
 
 - `text` (str): 리포트에 표시할 코드입니다.

---

## <kbd>class</kbd> `InlineLatex`
인라인 LaTeX 마크다운입니다. LaTeX 마크다운 뒤에 줄 바꿈 문자를 추가하지 않습니다.

**Attributes:**
 
 - `text` (str): 리포트에 표시할 LaTeX 마크다운입니다.

---

## <kbd>class</kbd> `LatexBlock`
LaTeX 텍스트 블록입니다.

**Attributes:**
 
 - `text` (str): LaTeX 텍스트입니다.

---

## <kbd>class</kbd> `Layout`
리포트의 패널 레이아웃입니다. 패널의 크기와 위치를 조정합니다.

**Attributes:**
 
 - `x` (int): 패널의 x 위치입니다.
 - `y` (int): 패널의 y 위치입니다.
 - `w` (int): 패널의 너비입니다.
 - `h` (int): 패널의 높이입니다.

---

## <kbd>class</kbd> `LinePlot`
2D 선 플롯이 있는 패널 오브젝트입니다.

**Attributes:**
 
 - `title` (Optional[str]): 플롯 상단에 표시되는 텍스트입니다.
 - `x` (Optional[MetricType]): 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 메트릭 이름입니다. 지정된 메트릭은 x축에 사용됩니다.
 - `y` (LList[MetricType]): 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 하나 이상의 메트릭입니다. 지정된 메트릭은 y축에 사용됩니다.
 - `range_x` (Tuple[float | `None`, float | `None`]): x축의 범위를 지정하는 튜플입니다.
 - `range_y` (Tuple[float | `None`, float | `None`]): y축의 범위를 지정하는 튜플입니다.
 - `log_x` (Optional[bool]): 밑이 10인 로그 스케일을 사용하여 x좌표를 플로팅합니다.
 - `log_y` (Optional[bool]): 밑이 10인 로그 스케일을 사용하여 y좌표를 플로팅합니다.
 - `title_x` (Optional[str]): x축 레이블입니다.
 - `title_y` (Optional[str]): y축 레이블입니다.
 - `ignore_outliers` (Optional[bool]): `True`로 설정되면 이상값을 플로팅하지 않습니다.
 - `groupby` (Optional[str]): 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 메트릭을 기반으로 run을 그룹화합니다.
 - `groupby_aggfunc` (Optional[GroupAgg]): 지정된 함수로 run을 집계합니다. 옵션에는 `mean`, `min`, `max`, `median`, `sum`, `samples` 또는 `None`이 있습니다.
 - `groupby_rangefunc` (Optional[GroupArea]): 범위를 기준으로 run을 그룹화합니다. 옵션에는 `minmax`, `stddev`, `stderr`, `none`, `samples` 또는 `None`이 있습니다.
 - `smoothing_factor` (Optional[float]): 스무딩 유형에 적용할 스무딩 계수입니다. 허용되는 값의 범위는 0에서 1 사이입니다.
 - `smoothing_type Optional[SmoothingType]`: 지정된 분포를 기반으로 필터를 적용합니다. 옵션에는 `exponentialTimeWeighted`, `exponential`, `gaussian`, `average` 또는 `none`이 있습니다.
 - `smoothing_show_original` (Optional[bool]): `True`로 설정되면 원본 데이터를 표시합니다.
 - `max_runs_to_show` (Optional[int]): 선 플롯에 표시할 최대 run 수입니다.
 - `custom_expressions` (Optional[LList[str]]): 데이터에 적용할 사용자 정의 표현식입니다.
 - `plot_type Optional[LinePlotStyle]`: 생성할 선 플롯 유형입니다. 옵션에는 `line`, `stacked-area` 또는 `pct-area`가 있습니다.
 - `font_size Optional[FontSize]`: 선 플롯 글꼴 크기입니다. 옵션에는 `small`, `medium`, `large`, `auto` 또는 `None`이 있습니다.
 - `legend_position Optional[LegendPosition]`: 범례를 배치할 위치입니다. 옵션에는 `north`, `south`, `east`, `west` 또는 `None`이 있습니다.
 - `legend_template` (Optional[str]): 범례 템플릿입니다.
 - `aggregate` (Optional[bool]): `True`로 설정되면 데이터를 집계합니다.
 - `xaxis_expression` (Optional[str]): x축 표현식입니다.
 - `legend_fields` (Optional[LList[str]]): 범례에 포함할 필드입니다.

---

## <kbd>class</kbd> `Link`
URL에 대한 링크입니다.

**Attributes:**
 
 - `text` (Union[str, TextWithInlineComments]): 링크 텍스트입니다.
 - `url` (str): 링크가 가리키는 URL입니다.

---

## <kbd>class</kbd> `MarkdownBlock`
마크다운 텍스트 블록입니다. 일반적인 마크다운 구문을 사용하는 텍스트를 작성하려는 경우에 유용합니다.

**Attributes:**
 
 - `text` (str): 마크다운 텍스트입니다.

---

## <kbd>class</kbd> `MarkdownPanel`
마크다운을 렌더링하는 패널입니다.

**Attributes:**
 
 - `markdown` (str): 마크다운 패널에 표시할 텍스트입니다.

---

## <kbd>class</kbd> `MediaBrowser`
미디어 파일을 그리드 레이아웃으로 표시하는 패널입니다.

**Attributes:**
 
 - `num_columns` (Optional[int]): 그리드의 열 수입니다.
 - `media_keys` (LList[str]): 미디어 파일에 해당하는 미디어 키 목록입니다.

---

## <kbd>class</kbd> `Metric`
프로젝트에 기록된 리포트에 표시할 메트릭입니다.

**Attributes:**
 
 - `name` (str): 메트릭 이름입니다.

---

## <kbd>class</kbd> `OrderBy`
정렬할 메트릭입니다.

**Attributes:**
 
 - `name` (str): 메트릭 이름입니다.
 - `ascending` (bool): 오름차순으로 정렬할지 여부입니다. 기본적으로 `False`로 설정됩니다.

---

## <kbd>class</kbd> `OrderedList`
번호 매겨진 목록의 항목 목록입니다.

**Attributes:**
 
 - `items` (LList[str]): 하나 이상의 `OrderedListItem` 오브젝트 목록입니다.

---

## <kbd>class</kbd> `OrderedListItem`
순서가 지정된 목록의 목록 항목입니다.

**Attributes:**
 
 - `text` (str): 목록 항목의 텍스트입니다.

---

## <kbd>class</kbd> `P`
텍스트 단락입니다.

**Attributes:**
 
 - `text` (str): 단락 텍스트입니다.

---

## <kbd>class</kbd> `Panel`
패널 그리드에 시각화를 표시하는 패널입니다.

**Attributes:**
 
 - `layout` (Layout): `Layout` 오브젝트입니다.

---

## <kbd>class</kbd> `PanelGrid`
runset 및 패널로 구성된 그리드입니다. `Runset` 및 `Panel` 오브젝트를 사용하여 각각 runset 및 패널을 추가합니다.

사용 가능한 패널은 다음과 같습니다. `LinePlot`, `ScatterPlot`, `BarPlot`, `ScalarChart`, `CodeComparer`, `ParallelCoordinatesPlot`, `ParameterImportancePlot`, `RunComparer`, `MediaBrowser`, `MarkdownPanel`, `CustomChart`, `WeavePanel`, `WeavePanelSummaryTable`, `WeavePanelArtifactVersionedFile`.

**Attributes:**
 
 - `runsets` (LList["Runset"]): 하나 이상의 `Runset` 오브젝트 목록입니다.
 - `panels` (LList["PanelTypes"]): 하나 이상의 `Panel` 오브젝트 목록입니다.
 - `active_runset` (int): runset 내에 표시할 run 수입니다. 기본적으로 0으로 설정됩니다.
 - `custom_run_colors` (dict): 키가 run 이름이고 값이 16진수 값으로 지정된 색상인 키-값 쌍입니다.

---

## <kbd>class</kbd> `ParallelCoordinatesPlot`
평행 좌표 플롯을 표시하는 패널 오브젝트입니다.

**Attributes:**
 
 - `columns` (LList[ParallelCoordinatesPlotColumn]): 하나 이상의 `ParallelCoordinatesPlotColumn` 오브젝트 목록입니다.
 - `title` (Optional[str]): 플롯 상단에 표시되는 텍스트입니다.
 - `gradient` (Optional[LList[GradientPoint]]): 그레이디언트 점 목록입니다.
 - `font_size` (Optional[FontSize]): 선 플롯 글꼴 크기입니다. 옵션에는 `small`, `medium`, `large`, `auto` 또는 `None`이 있습니다.

---

## <kbd>class</kbd> `ParallelCoordinatesPlotColumn`
평행 좌표 플롯 내의 열입니다. 지정된 `metric` 순서에 따라 평행 좌표 플롯에서 평행축(x축)의 순서가 결정됩니다.

**Attributes:**
 
 - `metric` (str | Config | SummaryMetric): 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 메트릭 이름입니다.
 - `display_name` (Optional[str]): 메트릭 이름입니다.
 - `inverted` (Optional[bool]): 메트릭을 반전할지 여부입니다.
 - `log` (Optional[bool]): 메트릭에 로그 변환을 적용할지 여부입니다.

---

## <kbd>class</kbd> `ParameterImportancePlot`
선택한 메트릭을 예측하는 데 각 하이퍼파라미터가 얼마나 중요한지 보여주는 패널입니다.

**Attributes:**
 
 - `with_respect_to` (str): 파라미터 중요도를 비교할 메트릭입니다. 일반적인 메트릭에는 손실, 정확도 등이 있습니다. 지정하는 메트릭은 리포트가 정보를 가져오는 프로젝트 내에 기록되어야 합니다.

---

## <kbd>class</kbd> `Report`
W&B Report를 나타내는 오브젝트입니다. 리포트를 사용자 정의하려면 반환된 오브젝트의 `blocks` 속성을 사용하세요. Report 오브젝트는 자동으로 저장되지 않습니다. 변경 사항을 유지하려면 `save()` 메소드를 사용하세요.

**Attributes:**
 
 - `project` (str): 로드할 W&B 프로젝트 이름입니다. 지정된 프로젝트는 리포트 URL에 나타납니다.
 - `entity` (str): 리포트를 소유한 W&B entity입니다. entity는 리포트 URL에 나타납니다.
 - `title` (str): 리포트 제목입니다. 제목은 리포트 상단에 H1 제목으로 나타납니다.
 - `description` (str): 리포트 설명입니다. 설명은 리포트 제목 아래에 나타납니다.
 - `blocks` (LList[BlockTypes]): 하나 이상의 HTML 태그, 플롯, 그리드, runset 등의 목록입니다.
 - `width` (Literal['readable', 'fixed', 'fluid']): 리포트 너비입니다. 옵션에는 'readable', 'fixed', 'fluid'가 있습니다.

---

#### <kbd>property</kbd> url

리포트가 호스팅되는 URL입니다. 리포트 URL은 `https://wandb.ai/{entity}/{project_name}/reports/`로 구성됩니다. 여기서 `{entity}` 및 `{project_name}`은 리포트가 속한 entity와 프로젝트 이름으로 구성됩니다.

---

### <kbd>classmethod</kbd> `from_url`

```python
from_url(url: str, as_model: bool = False)
```

리포트를 현재 환경으로 로드합니다. 리포트가 호스팅되는 URL을 전달합니다.

**Arguments:**
 
 - `url` (str): 리포트가 호스팅되는 URL입니다.
 - `as_model` (bool): True이면 Report 오브젝트 대신 model 오브젝트를 반환합니다. 기본적으로 `False`로 설정됩니다.

---

### <kbd>method</kbd> `save`

```python
save(draft: bool = False, clone: bool = False)
```

리포트 오브젝트에 대한 변경 사항을 유지합니다.

---

### <kbd>method</kbd> `to_html`

```python
to_html(height: int = 1024, hidden: bool = False) → str
```

이 리포트를 표시하는 iframe이 포함된 HTML을 생성합니다. 일반적으로 Python 노트북 내에서 사용됩니다.

**Arguments:**
 
 - `height` (int): iframe 높이입니다.
 - `hidden` (bool): True이면 iframe을 숨깁니다. 기본적으로 `False`로 설정됩니다.

---

## <kbd>class</kbd> `RunComparer`
리포트가 정보를 가져오는 프로젝트의 서로 다른 run에서 메트릭을 비교하는 패널입니다.

**Attributes:**
 
 - `diff_only` `(Optional[Literal["split", True]])`: 프로젝트의 run 간 차이만 표시합니다. W&B Report UI에서 이 기능을 켜고 끌 수 있습니다.

---

## <kbd>class</kbd> `Runset`
패널 그리드에 표시할 run 집합입니다.

**Attributes:**
 
 - `entity` (str): run이 저장된 프로젝트를 소유하거나 올바른 권한을 가진 entity입니다.
 - `project` (str): run이 저장된 프로젝트 이름입니다.
 - `name` (str): run set 이름입니다. 기본적으로 `Run set`으로 설정됩니다.
 - `query` (str): run을 필터링하는 쿼리 문자열입니다.
 - `filters` (Optional[str]): run을 필터링하는 필터 문자열입니다.
 - `groupby` (LList[str]): 그룹화할 메트릭 이름 목록입니다.
 - `order` (LList[OrderBy]): 정렬할 `OrderBy` 오브젝트 목록입니다.
 - `custom_run_colors` (LList[OrderBy]): run ID를 색상에 매핑하는 사전입니다.

---

## <kbd>class</kbd> `RunsetGroup`
runset 그룹을 표시하는 UI 요소입니다.

**Attributes:**
 
 - `runset_name` (str): runset 이름입니다.
 - `keys` (Tuple[RunsetGroupKey, ...]): 그룹화할 키입니다. 그룹화할 하나 이상의 `RunsetGroupKey` 오브젝트를 전달합니다.

---

## <kbd>class</kbd> `RunsetGroupKey`
메트릭 유형 및 값으로 runset을 그룹화합니다. `RunsetGroup`의 일부입니다. 그룹화할 메트릭 유형 및 값을 키-값 쌍으로 지정합니다.

**Attributes:**
 
 - `key` (Type[str] | Type[Config] | Type[SummaryMetric] | Type[Metric]): 그룹화할 메트릭 유형입니다.
 - `value` (str): 그룹화할 메트릭 값입니다.

---

## <kbd>class</kbd> `ScalarChart`
스칼라 차트를 표시하는 패널 오브젝트입니다.

**Attributes:**
 
 - `title` (Optional[str]): 플롯 상단에 표시되는 텍스트입니다.
 - `metric` (MetricType): 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 메트릭 이름입니다.
 - `groupby_aggfunc` (Optional[GroupAgg]): 지정된 함수로 run을 집계합니다. 옵션에는 `mean`, `min`, `max`, `median`, `sum`, `samples` 또는 `None`이 있습니다.
 - `groupby_rangefunc` (Optional[GroupArea]): 범위를 기준으로 run을 그룹화합니다. 옵션에는 `minmax`, `stddev`, `stderr`, `none`, `samples` 또는 `None`이 있습니다.
 - `custom_expressions` (Optional[LList[str]]): 스칼라 차트에 사용할 사용자 정의 표현식 목록입니다.
 - `legend_template` (Optional[str]): 범례 템플릿입니다.
 - `font_size Optional[FontSize]`: 선 플롯 글꼴 크기입니다. 옵션에는 `small`, `medium`, `large`, `auto` 또는 `None`이 있습니다.

---

## <kbd>class</kbd> `ScatterPlot`
2D 또는 3D 산점도를 표시하는 패널 오브젝트입니다.

**Arguments:**
 
 - `title` (Optional[str]): 플롯 상단에 표시되는 텍스트입니다.
 - `x Optional[SummaryOrConfigOnlyMetric]`: 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 메트릭 이름입니다. 지정된 메트릭은 x축에 사용됩니다.
 - `y Optional[SummaryOrConfigOnlyMetric]`: 리포트가 정보를 가져오는 W&B 프로젝트에 기록된 하나 이상의 메트릭입니다. 지정된 메트릭은 y축 내에 플로팅됩니다. z Optional[SummaryOrConfigOnlyMetric]:
 - `range_x` (Tuple[float | `None`, float | `None`]): x축의 범위를 지정하는 튜플입니다.
 - `range_y` (Tuple[float | `None`, float | `None`]): y축의 범위를 지정하는 튜플입니다.
 - `range_z` (Tuple[float | `None`, float | `None`]): z축의 범위를 지정하는 튜플입니다.
 - `log_x` (Optional[bool]): 밑이 10인 로그 스케일을 사용하여 x좌표를 플로팅합니다.
 - `log_y` (Optional[bool]): 밑이 10인 로그 스케일을 사용하여 y좌표를 플로팅합니다.
 - `log_z` (Optional[bool]): 밑이 10인 로그 스케일을 사용하여 z좌표를 플로팅합니다.
 - `running_ymin` (Optional[bool]): 이동 평균 또는 롤링 평균을 적용합니다.
 - `running_ymax` (Optional[bool]): 이동 평균 또는 롤링 평균을 적용합니다.
 - `running_ymean` (Optional[bool]): 이동 평균 또는 롤링 평균을 적용합니다.
 - `legend_template` (Optional[str]): 범례 형식을 지정하는 문자열입니다.
 - `gradient` (Optional[LList[GradientPoint]]): 플롯의 색상 그레이디언트를 지정하는 그레이디언트 점 목록입니다.
 - `font_size` (Optional[FontSize]): 선 플롯 글꼴 크기입니다. 옵션에는 `small`, `medium`, `large`, `auto` 또는 `None`이 있습니다.
 - `regression` (Optional[bool]): `True`이면 산점도에 회귀선이 플로팅됩니다.

---

## <kbd>class</kbd> `SoundCloud`
SoundCloud 플레이어를 렌더링하는 블록입니다.

**Attributes:**
 
 - `html` (str): SoundCloud 플레이어를 포함할 HTML 코드입니다.

---

## <kbd>class</kbd> `Spotify`
Spotify 플레이어를 렌더링하는 블록입니다.

**Attributes:**
 
 - `spotify_id` (str): 트랙 또는 재생 목록의 Spotify ID입니다.

---

## <kbd>class</kbd> `SummaryMetric`
리포트에 표시할 요약 메트릭입니다.

**Attributes:**
 
 - `name` (str): 메트릭 이름입니다.

---

## <kbd>class</kbd> `TableOfContents`
리포트에 지정된 H1, H2 및 H3 HTML 블록을 사용하여 섹션 및 하위 섹션 목록을 포함하는 블록입니다.

---

## <kbd>class</kbd> `TextWithInlineComments`
인라인 주석이 있는 텍스트 블록입니다.

**Attributes:**
 
 - `text` (str): 블록 텍스트입니다.

---

## <kbd>class</kbd> `Twitter`
Twitter 피드를 표시하는 블록입니다.

**Attributes:**
 
 - `html` (str): Twitter 피드를 표시할 HTML 코드입니다.

---

## <kbd>class</kbd> `UnorderedList`
글머리 기호 목록의 항목 목록입니다.

**Attributes:**
 
 - `items` (LList[str]): 하나 이상의 `UnorderedListItem` 오브젝트 목록입니다.

---

## <kbd>class</kbd> `UnorderedListItem`
순서가 지정되지 않은 목록의 목록 항목입니다.

**Attributes:**
 
 - `text` (str): 목록 항목의 텍스트입니다.

---

## <kbd>class</kbd> `Video`
비디오를 렌더링하는 블록입니다.

**Attributes:**
 
 - `url` (str): 비디오 URL입니다.

---

## <kbd>class</kbd> `WeaveBlockArtifact`
W&B에 기록된 아티팩트를 표시하는 블록입니다. 쿼리는 다음과 같은 형식을 취합니다.

```python
project('entity', 'project').artifact('artifact-name')
```

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

**Attributes:**
 
 - `entity` (str): 아티팩트가 저장된 프로젝트를 소유하거나 적절한 권한을 가진 entity입니다.
 - `project` (str): 아티팩트가 저장된 프로젝트입니다.
 - `artifact` (str): 검색할 아티팩트 이름입니다.
 - `tab Literal["overview", "metadata", "usage", "files", "lineage"]`: 아티팩트 패널에 표시할 탭입니다.

---

## <kbd>class</kbd> `WeaveBlockArtifactVersionedFile`
W&B 아티팩트에 기록된 버전 관리 파일을 표시하는 블록입니다. 쿼리는 다음과 같은 형식을 취합니다.

```python
project('entity', 'project').artifactVersion('name', 'version').file('file-name')
```

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

**Attributes:**
 
 - `entity` (str): 아티팩트가 저장된 프로젝트를 소유하거나 적절한 권한을 가진 entity입니다.
 - `project` (str): 아티팩트가 저장된 프로젝트입니다.
 - `artifact` (str): 검색할 아티팩트 이름입니다.
 - `version` (str): 검색할 아티팩트 버전입니다.
 - `file` (str): 검색할 아티팩트에 저장된 파일 이름입니다.

---

## <kbd>class</kbd> `WeaveBlockSummaryTable`
W&B에 기록된 W&B Table, pandas DataFrame, 플롯 또는 기타 값을 표시하는 블록입니다. 쿼리는 다음과 같은 형식을 취합니다.

```python
project('entity', 'project').runs.summary['value']
```

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

**Attributes:**
 
 - `entity` (str): 값이 기록된 프로젝트를 소유하거나 적절한 권한을 가진 entity입니다.
 - `project` (str): 값이 기록된 프로젝트입니다.
 - `table_name` (str): 테이블, DataFrame, 플롯 또는 값의 이름입니다.

---

## <kbd>class</kbd> `WeavePanel`
쿼리를 사용하여 사용자 정의 콘텐츠를 표시하는 데 사용할 수 있는 빈 쿼리 패널입니다.

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

---

## <kbd>class</kbd> `WeavePanelArtifact`
W&B에 기록된 아티팩트를 표시하는 패널입니다.

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

**Attributes:**
 
 - `artifact` (str): 검색할 아티팩트 이름입니다.
 - `tab Literal["overview", "metadata", "usage", "files", "lineage"]`: 아티팩트 패널에 표시할 탭입니다.

---

## <kbd>class</kbd> `WeavePanelArtifactVersionedFile`
W&B 아티팩트에 기록된 버전 관리 파일을 표시하는 패널입니다.

```python
project('entity', 'project').artifactVersion('name', 'version').file('file-name')
```

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

**Attributes:**
 
 - `artifact` (str): 검색할 아티팩트 이름입니다.
 - `version` (str): 검색할 아티팩트 버전입니다.
 - `file` (str): 검색할 아티팩트에 저장된 파일 이름입니다.

---

## <kbd>class</kbd> `WeavePanelSummaryTable`
W&B에 기록된 W&B Table, pandas DataFrame, 플롯 또는 기타 값을 표시하는 패널입니다. 쿼리는 다음과 같은 형식을 취합니다.

```python
runs.summary['value']
```

API 이름의 "Weave"라는 용어는 LLM을 추적하고 평가하는 데 사용되는 W&B Weave 툴킷을 지칭하지 않습니다.

**Attributes:**
 
 - `table_name` (str): 테이블, DataFrame, 플롯 또는 값의 이름입니다.
