#장고의 모델 데이터를 Json 형태로 만들기
from rest_framework import serializers
from .models import Quiz

class QuizSerializer(serializers.ModelSerializer):
    class Meta:
        model = Quiz
        fields = ('title', 'body', 'answer')