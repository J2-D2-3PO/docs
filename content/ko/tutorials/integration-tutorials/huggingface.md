---
title: Hugging Face
menu:
  tutorials:
    identifier: ko-tutorials-integration-tutorials-huggingface
    parent: integration-tutorials
weight: 3
---

{{< img src="/images/tutorials/huggingface.png" alt="" >}}

{{< cta-button colabLink="https://colab.research.google.com/github/wandb/examples/blob/master/colabs/huggingface/Huggingface_wandb.ipynb" >}}
원활한 [W&B](https://wandb.ai/site) 연동으로 [Hugging Face](https://github.com/huggingface/transformers) 모델의 성능을 빠르게 시각화하세요.

모델 전반에서 하이퍼파라미터, 출력 메트릭, GPU 사용률과 같은 시스템 통계를 비교합니다.

## W&B를 사용해야 하는 이유
{.skipvale}

{{< img src="/images/tutorials/huggingface-why.png" alt="" >}}

- **통합 대시보드**: 모든 모델 메트릭 및 예측값에 대한 중앙 저장소
- **간편함**: Hugging Face와 통합하기 위해 코드 변경이 필요하지 않음
- **접근성**: 개인 및 학술 팀에 무료 제공
- **보안**: 모든 Projects는 기본적으로 비공개임
- **신뢰성**: OpenAI, Toyota, Lyft 등의 기계 학습 팀에서 사용

W&B는 기계 학습 모델을 위한 GitHub와 같습니다. 개인 호스팅 대시보드에 기계 학습 Experiments를 저장하세요. 스크립트를 실행하는 위치에 관계없이 모델의 모든 버전을 저장하므로 안심하고 빠르게 실험할 수 있습니다.

W&B의 간편한 인테그레이션은 모든 Python 스크립트에서 작동하며, 모델 추적 및 시각화를 시작하려면 무료 W&B 계정에 가입하기만 하면 됩니다.

Hugging Face Transformers repo에서 Trainer를 통해 각 로깅 단계에서 트레이닝 및 평가 메트릭을 W&B에 자동으로 기록합니다.

다음은 인테그레이션 작동 방식에 대한 자세한 내용입니다: [Hugging Face + W&B Report](https://app.wandb.ai/jxmorris12/huggingface-demo/reports/Train-a-model-with-Hugging-Face-and-Weights-%26-Biases--VmlldzoxMDE2MTU).

## 설치, 임포트 및 로그인

Hugging Face 및 Weights & Biases 라이브러리, 그리고 이 튜토리얼의 GLUE 데이터셋 및 트레이닝 스크립트를 설치합니다.
- [Hugging Face Transformers](https://github.com/huggingface/transformers): 자연어 모델 및 데이터셋
- [Weights & Biases]({{< relref path="/" lang="ko" >}}): Experiment 추적 및 시각화
- [GLUE dataset](https://gluebenchmark.com/): 언어 이해 벤치마크 데이터셋
- [GLUE script](https://raw.githubusercontent.com/huggingface/transformers/refs/heads/main/examples/pytorch/text-classification/run_glue.py): 시퀀스 분류를 위한 모델 트레이닝 스크립트

```notebook
!pip install datasets wandb evaluate accelerate -qU
!wget https://raw.githubusercontent.com/huggingface/transformers/refs/heads/main/examples/pytorch/text-classification/run_glue.py
```

```notebook
# run_glue.py 스크립트를 실행하려면 transformers dev가 필요합니다.
!pip install -q git+https://github.com/huggingface/transformers
```

계속하기 전에 [무료 계정에 가입](https://app.wandb.ai/login?signup=true)하세요.

## API 키 넣기

가입했으면 다음 셀을 실행하고 링크를 클릭하여 API 키를 가져와 이 노트북을 인증합니다.

```python
import wandb
wandb.login()
```

선택적으로 환경 변수를 설정하여 W&B 로깅을 사용자 정의할 수 있습니다. [설명서]({{< relref path="/guides/integrations/huggingface/" lang="ko" >}})를 참조하세요.

```python
# 선택 사항: 그레이디언트와 파라미터를 모두 기록합니다.
%env WANDB_WATCH=all
```

## 모델 트레이닝
다음으로 다운로드한 트레이닝 스크립트 [run_glue.py](https://huggingface.co/transformers/examples.html#glue)를 호출하고 트레이닝이 Weights & Biases 대시보드에서 자동으로 추적되는지 확인합니다. 이 스크립트는 의미상 동등한지 여부를 나타내는 사람 주석이 있는 문장 쌍인 Microsoft Research Paraphrase Corpus에서 BERT를 파인튜닝합니다.

```python
%env WANDB_PROJECT=huggingface-demo
%env TASK_NAME=MRPC

!python run_glue.py \
  --model_name_or_path bert-base-uncased \
  --task_name $TASK_NAME \
  --do_train \
  --do_eval \
  --max_seq_length 256 \
  --per_device_train_batch_size 32 \
  --learning_rate 2e-4 \
  --num_train_epochs 3 \
  --output_dir /tmp/$TASK_NAME/ \
  --overwrite_output_dir \
  --logging_steps 50
```

## 대시보드에서 결과 시각화
위에 출력된 링크를 클릭하거나 [wandb.ai](https://app.wandb.ai)로 이동하여 결과가 실시간으로 스트리밍되는 것을 확인하세요. 브라우저에서 run을 볼 수 있는 링크는 모든 종속성이 로드된 후에 나타납니다. 다음 출력을 찾으세요: "**wandb**: 🚀 View run at [URL to your unique run]"

**모델 성능 시각화**
수십 개의 Experiments를 살펴보고, 흥미로운 발견에 집중하고, 고차원 데이터를 시각화하는 것이 쉽습니다.

{{< img src="/images/tutorials/huggingface-visualize.gif" alt="" >}}

**아키텍처 비교**
다음은 [BERT vs DistilBERT](https://app.wandb.ai/jack-morris/david-vs-goliath/reports/Does-model-size-matter%3F-Comparing-BERT-and-DistilBERT-using-Sweeps--VmlldzoxMDUxNzU)를 비교하는 예입니다. 자동 라인 플롯 시각화를 통해 트레이닝 전반에 걸쳐 다양한 아키텍처가 평가 정확도에 미치는 영향을 쉽게 확인할 수 있습니다.

{{< img src="/images/tutorials/huggingface-comparearchitectures.gif" alt="" >}}

## 기본적으로 주요 정보를 간편하게 추적
Weights & Biases는 각 Experiment에 대해 새 run을 저장합니다. 다음은 기본적으로 저장되는 정보입니다.
- **하이퍼파라미터**: 모델 설정은 Config에 저장됩니다.
- **모델 메트릭**: 스트리밍되는 메트릭의 시계열 데이터는 로그에 저장됩니다.
- **터미널 로그**: 커맨드라인 출력이 저장되어 탭에서 사용할 수 있습니다.
- **시스템 메트릭**: GPU 및 CPU 사용률, 메모리, 온도 등

## 자세히 알아보기
- [설명서]({{< relref path="/guides/integrations/huggingface" lang="ko" >}}): Weights & Biases 및 Hugging Face 인테그레이션에 대한 문서
- [동영상](http://wandb.me/youtube): YouTube 채널에서 튜토리얼, 실무자와의 인터뷰 등을 시청하세요.
- 문의: 질문이 있는 경우 contact@wandb.com으로 메시지를 보내주세요.
