# Django 주요 명령어
## 기본 생성 및 실행
```
django-admin startproject {PROJECT_NAME} {PROJECT_PATH}
```
장고 프로젝트 생성하기

```
python manage.py runserver
```
장고 서버 실행하기

```
python manage.py startapp {APP_NAME}
```
{APP_NAME} 이라는 앱 폴더 파일 생성하기

## DB 관리
```
python manage.py migrate
```
데이터베이스 생성하기
```
python manage.py createsuperuser
```
관리자 계정 생성

## 모델 관리
```
python manage.py makemigrations
```
데이터 베이스에 모델 반영하기
* settings.py 파일 안에 앱을 등록해야함