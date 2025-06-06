---
title: Azure OpenAI Fine-Tuning
description: W&B를 사용하여 Azure OpenAI 모델을 파인튜닝하는 방법.
menu:
  default:
    identifier: ko-guides-integrations-azure-openai-fine-tuning
    parent: integrations
weight: 20
---

## 도입
W&B를 사용하여 Microsoft Azure에서 GPT-3.5 또는 GPT-4 모델을 미세 조정하면 메트릭을 자동으로 캡처하고 W&B의 실험 추적 및 평가 툴을 통해 체계적인 평가를 용이하게 하여 모델 성능을 추적, 분석 및 개선할 수 있습니다.

{{< img src="/images/integrations/aoai_ft_plot.png" alt="" >}}

## 전제 조건
- [공식 Azure 설명서](https://wandb.me/aoai-wb-int)에 따라 Azure OpenAI 서비스를 설정합니다.
- API 키로 W&B 계정을 구성합니다.

## 워크플로우 개요

### 1. 미세 조정 설정
- Azure OpenAI 요구 사항에 따라 트레이닝 데이터를 준비합니다.
- Azure OpenAI에서 미세 조정 작업을 구성합니다.
- W&B는 미세 조정 프로세스를 자동으로 추적하여 메트릭 및 하이퍼파라미터를 기록합니다.

### 2. 실험 추적
미세 조정하는 동안 W&B는 다음을 캡처합니다.
- 트레이닝 및 유효성 검사 메트릭
- 모델 하이퍼파라미터
- 리소스 활용률
- 트레이닝 Artifacts

### 3. 모델 평가
미세 조정한 후 [W&B Weave](https://weave-docs.wandb.ai)를 사용하여 다음을 수행합니다.
- 참조 데이터셋에 대한 모델 출력을 평가합니다.
- 다양한 미세 조정 Runs에서 성능을 비교합니다.
- 특정 테스트 케이스에서 모델 행동을 분석합니다.
- 모델 선택을 위해 데이터 기반 결정을 내립니다.

## 실제 예제
* 이 통합이 어떻게 촉진하는지 보려면 [의료 기록 생성 데모](https://wandb.me/aoai-ft-colab)를 살펴보십시오.
  - 미세 조정 Experiments의 체계적인 추적
  - 도메인별 메트릭을 사용한 모델 평가
* [노트북 미세 조정에 대한 대화형 데모](https://colab.research.google.com/github/wandb/examples/blob/master/colabs/azure/azure_gpt_medical_notes.ipynb)를 살펴보십시오.

## 추가 자료
- [Azure OpenAI W&B Integration 가이드](https://wandb.me/aoai-wb-int)
- [Azure OpenAI 미세 조정 설명서](https://learn.microsoft.com/azure/ai-services/openai/how-to/fine-tuning?tabs=turbo%2Cpython&pivots=programming-language-python)
