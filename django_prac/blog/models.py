from django.db import models

class Post(models.Model):
    title = models.CharField(max_length=30)
    content = models.TextField()

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    # Post의 제목 설정하기 (ADMIN 창에서 보임)
    # PK : Primary key
    def __str__(self):
        return f'[{self.pk}]{self.title}'