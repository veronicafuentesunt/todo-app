from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from rest_framework.routers import DefaultRouter

from tasks.views import TaskViewSet, StatsViewSet  # omit StatsViewSet if you aren't using it

router = DefaultRouter()
router.register(r'tasks', TaskViewSet, basename='task')
router.register(r'stats', StatsViewSet, basename='stats')  # remove this line if not using stats

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    path('', TemplateView.as_view(template_name='index.html'), name='home'),
]