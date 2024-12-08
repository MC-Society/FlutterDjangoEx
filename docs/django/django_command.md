# Django 주요 명령어
## 기본 생성 및 실행
```
django-admin startproject {PROJECT_NAME} {PROJECT_PATH}
```
Django 프로젝트 생성하기

```
python manage.py runserver
```
Django 서버 실행하기

```
python manage.py startapp {APP_NAME}
```
{APP_NAME} 이라는 앱 폴더 파일 생성하기

## DB 관리
```
python manage.py migrate
```
데이터베이스 생성/반영하기
```
python manage.py createsuperuser
```
관리자 계정 생성

## Model 관리
``` 
python manage.py makemigrations # 변경사항에 대한 마이그레이션 파일 생성
python manage.py migrate        # 마이그레이션 파일 데이터베이스에 반영
python manage.py runserver      # Django 서버 실행
```
차례대로 실행하여 모델 적용할 수 있음<br><br>
python manage.py makemigrations 명령 실행 시
* settings.py 파일 안에 앱을 등록해야함