---
title: Example tables
description: W&B Tables 예시
menu:
  default:
    identifier: ko-guides-models-tables-tables-gallery
    parent: tables
---

다음 섹션에서는 테이블을 사용할 수 있는 몇 가지 방법을 중점적으로 설명합니다.

### 데이터 보기

모델 트레이닝 또는 평가 중에 메트릭과 풍부한 미디어를 기록한 다음, 클라우드 또는 [호스팅 인스턴스]({{< relref path="/guides/hosting" lang="ko" >}})에 동기화된 영구 데이터베이스에서 결과를 시각화합니다.

{{< img src="/images/data_vis/tables_see_data.png" alt="데이터 예제를 찾아보고 개수와 분포를 확인하세요." max-width="90%" >}}

예를 들어, [사진 데이터셋의 균형 잡힌 분할을 보여주는](https://wandb.ai/stacey/mendeleev/artifacts/balanced_data/inat_80-10-10_5K/ab79f01e007113280018/files/data_split.table.json) 테이블을 확인해 보세요.

### 데이터 대화형으로 탐색하기

테이블을 보고, 정렬하고, 필터링하고, 그룹화하고, 조인하고, 쿼리하여 데이터와 모델 성능을 이해합니다. 정적 파일을 찾아보거나 분석 스크립트를 다시 실행할 필요가 없습니다.

{{< img src="/images/data_vis/explore_data.png" alt="원본 노래와 합성 버전(음색 전송 포함)을 들어보세요." max-width="90%">}}

예를 들어, [스타일이 전송된 오디오](https://wandb.ai/stacey/cshanty/reports/Whale2Song-W-B-Tables-for-Audio--Vmlldzo4NDI3NzM)에 대한 이 report를 참조하세요.

### 모델 버전 비교

다양한 트레이닝 에포크, 데이터셋, 하이퍼파라미터 선택, 모델 아키텍처 등에서 결과를 빠르게 비교합니다.

{{< img src="/images/data_vis/compare_model_versions.png" alt="세분화된 차이점을 확인하세요. 왼쪽 모델은 일부 빨간색 보도를 감지하지만 오른쪽 모델은 감지하지 못합니다." max-width="90%">}}

예를 들어, [동일한 테스트 이미지에서 두 모델을 비교하는](https://wandb.ai/stacey/evalserver_answers_2/artifacts/results/eval_Daenerys/c2290abd3d7274f00ad8/files/eval_results.table.json#b6dae62d4f00d31eeebf$eval_Bob) 테이블을 참조하세요.

### 모든 세부 사항을 추적하고 더 큰 그림 보기

특정 단계에서 특정 예측을 시각화하기 위해 확대합니다. 집계 통계를 보고, 오류 패턴을 식별하고, 개선 기회를 파악하기 위해 축소합니다. 이 tool은 단일 모델 트레이닝의 단계를 비교하거나 서로 다른 모델 버전의 결과를 비교하는 데 사용할 수 있습니다.

{{< img src="/images/data_vis/track_details.png" alt="" >}}

예를 들어, [MNIST 데이터셋에서 1에포크 후, 5에포크 후의 결과를 분석하는](https://wandb.ai/stacey/mnist-viz/artifacts/predictions/baseline/d888bc05719667811b23/files/predictions.table.json#7dd0cd845c0edb469dec) 예제 테이블을 참조하세요.

## W&B Tables를 사용한 예제 Projects
다음은 W&B Tables를 사용하는 실제 W&B Projects를 강조합니다.

### 이미지 분류

[이 report](https://wandb.ai/stacey/mendeleev/reports/Visualize-Data-for-Image-Classification--VmlldzozNjE3NjA)를 읽고, [이 colab](https://wandb.me/dsviz-nature-colab)을 따르거나, [artifacts 컨텍스트](https://wandb.ai/stacey/mendeleev/artifacts/val_epoch_preds/val_pred_gawf9z8j/2dcee8fa22863317472b/files/val_epoch_res.table.json)를 탐색하여 CNN이 [iNaturalist](https://www.inaturalist.org/pages/developers) 사진에서 10가지 유형의 생물(식물, 새, 곤충 등)을 식별하는 방법을 확인하세요.

{{< img src="/images/data_vis/image_classification.png" alt="서로 다른 두 모델의 예측에서 실제 레이블의 분포를 비교합니다." max-width="90%">}}

### 오디오

음색 전송에 대한 [이 report](https://wandb.ai/stacey/cshanty/reports/Whale2Song-W-B-Tables-for-Audio--Vmlldzo4NDI3NzM)에서 오디오 테이블과 상호 작용합니다. 녹음된 고래 노래와 바이올린이나 트럼펫과 같은 악기로 동일한 멜로디를 합성한 연주를 비교할 수 있습니다. 또한 [이 colab](http://wandb.me/audio-transfer)을 사용하여 자신의 노래를 녹음하고 W&B에서 합성 버전을 탐색할 수도 있습니다.

{{< img src="/images/data_vis/audio.png" alt="" max-width="90%">}}

### 텍스트

트레이닝 데이터 또는 생성된 출력에서 텍스트 샘플을 찾아보고, 관련 필드별로 동적으로 그룹화하고, 모델 변형 또는 실험 설정에서 평가를 조정합니다. 텍스트를 Markdown으로 렌더링하거나 시각적 차이 모드를 사용하여 텍스트를 비교합니다. [이 report](https://wandb.ai/stacey/nlg/reports/Visualize-Text-Data-Predictions--Vmlldzo1NzcwNzY)에서 Shakespeare를 생성하기 위한 간단한 문자 기반 RNN을 탐색합니다.

{{< img src="/images/data_vis/shakesamples.png" alt="숨겨진 레이어의 크기를 두 배로 늘리면 좀 더 창의적인 프롬프트 완성이 가능합니다." max-width="90%">}}

### 비디오

트레이닝 중에 기록된 비디오를 찾아보고 집계하여 모델을 이해합니다. 다음은 [부작용을 최소화](https://wandb.ai/stacey/saferlife/artifacts/video/videos_append-spawn/c1f92c6e27fa0725c154/files/video_examples.table.json)하려는 RL 에이전트에 대한 [SafeLife 벤치마크](https://wandb.ai/safelife/v1dot2/benchmark)를 사용하는 초기 예제입니다.

{{< img src="/images/data_vis/video.png" alt="성공적인 에이전트를 쉽게 찾아보세요." max-width="90%">}}

### 표 형식 데이터

버전 관리 및 중복 제거를 통해 [표 형식 데이터를 분할하고 사전 처리하는 방법](https://wandb.ai/dpaiton/splitting-tabular-data/reports/Tabular-Data-Versioning-and-Deduplication-with-Weights-Biases--VmlldzoxNDIzOTA1)에 대한 report를 봅니다.

{{< img src="/images/data_vis/tabs.png" alt="테이블과 Artifacts는 함께 작동하여 데이터셋 반복을 버전 제어, 레이블 지정 및 중복 제거합니다." max-width="90%">}}

### 모델 변형 비교 (시멘틱 세분화)

시멘틱 세분화에 대한 테이블을 기록하고 서로 다른 모델을 비교하는 [대화형 노트북](https://wandb.me/dsviz-cars-demo) 및 [라이브 예제](https://wandb.ai/stacey/evalserver_answers_2/artifacts/results/eval_Daenerys/c2290abd3d7274f00ad8/files/eval_results.table.json#a57f8e412329727038c2$eval_Ada)입니다. [이 테이블](https://wandb.ai/stacey/evalserver_answers_2/artifacts/results/eval_Daenerys/c2290abd3d7274f00ad8/files/eval_results.table.json)에서 자신의 쿼리를 시도해 보세요.

{{< img src="/images/data_vis/comparing_model_variants.png" alt="동일한 테스트 세트에서 두 모델에서 가장 적합한 예측을 찾으세요." max-width="90%" >}}

### 트레이닝 시간 경과에 따른 개선 분석

[시간 경과에 따른 예측 시각화 방법](https://wandb.ai/stacey/mnist-viz/reports/Visualize-Predictions-over-Time--Vmlldzo1OTQxMTk)에 대한 자세한 report와 함께 제공되는 [대화형 노트북](https://wandb.me/dsviz-mnist-colab)입니다.
