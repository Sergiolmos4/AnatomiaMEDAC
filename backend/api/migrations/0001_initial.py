# Generated by Django 5.0.6 on 2024-06-12 18:01

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Aumento',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('zoom', models.CharField(default='x4', max_length=4, unique=True, verbose_name='Aumento')),
            ],
        ),
        migrations.CreateModel(
            name='Calidad',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=7, unique=True, verbose_name='Código')),
                ('descripcion', models.TextField(blank=True, verbose_name='Descripción')),
            ],
            options={
                'verbose_name': 'Calidad',
                'verbose_name_plural': 'Calidades',
            },
        ),
        migrations.CreateModel(
            name='Estado',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('estado', models.CharField(max_length=20, unique=True, verbose_name='Estado')),
                ('comentario', models.TextField(blank=True, null=True, verbose_name='Comentario')),
            ],
        ),
        migrations.CreateModel(
            name='Formato',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('formato', models.CharField(max_length=20, unique=True, verbose_name='Formato')),
            ],
        ),
        migrations.CreateModel(
            name='Interpretacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=7, unique=True, verbose_name='Código')),
                ('descripcion', models.TextField(blank=True, verbose_name='Descripción')),
            ],
            options={
                'verbose_name': 'Interpretación',
                'verbose_name_plural': 'Interpretaciones',
            },
        ),
        migrations.CreateModel(
            name='Naturaleza',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=2, unique=True, verbose_name='Código')),
                ('naturaleza', models.CharField(max_length=50, unique=True, verbose_name='Naturaleza')),
            ],
        ),
        migrations.CreateModel(
            name='Organo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('organo', models.CharField(max_length=30, unique=True, verbose_name='Órgano')),
                ('codigo', models.CharField(max_length=3, unique=True, verbose_name='Código')),
            ],
            options={
                'verbose_name': 'Órgano',
                'verbose_name_plural': 'Órganos',
            },
        ),
        migrations.CreateModel(
            name='Rol',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rol', models.CharField(max_length=15, unique=True, verbose_name='Rol')),
            ],
            options={
                'verbose_name': 'Rol',
                'verbose_name_plural': 'Roles',
            },
        ),
        migrations.CreateModel(
            name='Sede',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sede', models.CharField(max_length=11, unique=True, verbose_name='Sede')),
                ('codigo', models.CharField(max_length=4, unique=True, verbose_name='Código')),
            ],
        ),
        migrations.CreateModel(
            name='Tipo',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tipo', models.CharField(max_length=14, unique=True, verbose_name='Tipo')),
            ],
        ),
        migrations.CreateModel(
            name='Imagen',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('imagen', models.ImageField(default='camera.png', unique=True, upload_to='img', verbose_name='Imagen')),
                ('zoom', models.ForeignKey(db_column='zoom', default='x4', on_delete=django.db.models.deletion.RESTRICT, to='api.aumento', to_field='zoom')),
            ],
            options={
                'verbose_name': 'Imagen',
                'verbose_name_plural': 'Imágenes',
            },
        ),
        migrations.CreateModel(
            name='CodificacionInterpretacion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=7, unique=True, verbose_name='Código')),
                ('descripcion', models.TextField(verbose_name='Descripción')),
                ('naturaleza', models.ForeignKey(db_column='naturaleza', default='Biopsia', on_delete=django.db.models.deletion.RESTRICT, to='api.naturaleza', to_field='naturaleza', verbose_name='Naturaleza')),
                ('organo', models.ForeignKey(db_column='organo', default='Corazón', on_delete=django.db.models.deletion.RESTRICT, to='api.organo', to_field='organo', verbose_name='Órgano')),
                ('tipo', models.ForeignKey(db_column='tipo', default='Calidad', on_delete=django.db.models.deletion.RESTRICT, to='api.tipo', to_field='tipo', verbose_name='Tipo')),
            ],
            options={
                'verbose_name': 'Codificación de Interpretación',
                'verbose_name_plural': 'Codificaciones de Interpretación',
            },
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rol', models.ForeignKey(db_column='rol', default='Estudiante', on_delete=django.db.models.deletion.RESTRICT, to='api.rol', to_field='rol', verbose_name='Rol')),
                ('sede', models.ForeignKey(db_column='sede', default='Córdoba', on_delete=django.db.models.deletion.RESTRICT, to='api.sede', to_field='sede', verbose_name='Sede')),
                ('username', models.OneToOneField(db_column='username', default='admin', on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, to_field='username')),
            ],
        ),
        migrations.CreateModel(
            name='Muestra',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(max_length=20, unique=True, verbose_name='Código')),
                ('fecha_recepcion', models.DateField()),
                ('interpretacion', models.JSONField(blank=True, default=dict)),
                ('imagenes', models.JSONField(blank=True, default=dict)),
                ('zoom', models.JSONField(blank=True, default=dict)),
                ('descripcionCal', models.TextField(blank=True, null=True, verbose_name='Descripción Calidad')),
                ('descripcionInt', models.TextField(blank=True, null=True, verbose_name='Descripción Interpretación')),
                ('calidad', models.ForeignKey(db_column='calidad', default='Nulo', on_delete=django.db.models.deletion.RESTRICT, to='api.calidad', to_field='codigo', verbose_name='Calidad')),
                ('formato', models.ForeignKey(db_column='formato', default='Fresco', on_delete=django.db.models.deletion.RESTRICT, to='api.formato', to_field='formato', verbose_name='Formato')),
                ('naturaleza', models.ForeignKey(db_column='naturaleza', default='Semen', on_delete=django.db.models.deletion.RESTRICT, to='api.naturaleza', to_field='naturaleza', verbose_name='Naturaleza')),
                ('organo', models.ForeignKey(db_column='organo', default='Riñón', on_delete=django.db.models.deletion.RESTRICT, to='api.organo', to_field='organo', verbose_name='Órgano')),
                ('sede', models.ForeignKey(db_column='sede', default='C', on_delete=django.db.models.deletion.RESTRICT, to='api.sede', to_field='sede', verbose_name='Sede')),
                ('usuario', models.ForeignKey(db_column='username', default='admin', on_delete=django.db.models.deletion.RESTRICT, to='api.usuario', to_field='username', verbose_name='Usuario')),
            ],
        ),
    ]
