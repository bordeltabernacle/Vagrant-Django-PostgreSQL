# Vagrantfile for Django development

> A Vagrantfile that brings up 2 VMs, one for Django, the other with a PostgreSQL database.

## To access Django development server on guest, from Host:
- run `python manage.py runserver 0.0.0.0:8000` on guest.
- access on `http://localhost:8001/` on host.

## Database settings:
- in `settings.py`:
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'lld_db',
        'USER': 'django',
        'PASSWORD': 'django',
        'HOST': 'db',
        'PORT': '5432',
    }
}
```
