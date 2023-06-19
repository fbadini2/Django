# from django.db import models

# # Create your models here.
# from django.db import models
# from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

# class UsuarioManager(BaseUserManager):
#     def create_user(self, nombre, apellido, email, password=None, tipo=None):
#         if not email:
#             raise ValueError('El usuario debe tener una dirección de email válida.')
#         usuario = self.model(
#             nombre=nombre,
#             apellido=apellido,
#             email=self.normalize_email(email),
#             tipo=tipo,
#         )
#         usuario.set_password(password)
#         usuario.save(using=self._db)
#         return usuario

#     def create_superuser(self, nombre, apellido, email, password=None):
#         usuario = self.create_user(
#             nombre=nombre,
#             apellido=apellido,
#             email=email,
#             password=password,
#             tipo='administrador',
#         )
#         usuario.is_admin = True
#         usuario.save(using=self._db)
#         return usuario

# class Usuario(AbstractBaseUser):
#     nombre = models.CharField(max_length=50)
#     apellido = models.CharField(max_length=50)
#     email = models.EmailField(unique=True)
#     tipo = models.CharField(max_length=20, choices=(('docente', 'Docente'), ('alumno', 'Alumno'), ('administrador', 'Administrador')))
#     is_active = models.BooleanField(default=True)
#     is_admin = models.BooleanField(default=False)

#     objects = UsuarioManager()

#     USERNAME_FIELD = 'email'
#     REQUIRED_FIELDS = ['nombre', 'apellido']

#     def __str__(self):
#         return self.email

#     @property
#     def is_staff(self):
#         return self.is_admin
