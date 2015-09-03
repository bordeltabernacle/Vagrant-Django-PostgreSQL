# Vagrantfile for Django development

> A Vagrantfile that brings up 2 VMs, one for Django, the other with a PostgreSQL database.

***Requires Vagrant Host Manager Plugin.  `vagrant plugin install vagrant-hostmanager`***

## To access Django development server on guest, from Host:
- run `python manage.py runserver 0.0.0.0:8000` on guest.
- access on `http://localhost:django_8000_fp/` on host, where `django_8000_fp` is the port specified in the Vagrantfile.

## Database settings:
- in `settings.py`:
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'db',
        'USER': 'django',
        'PASSWORD': 'django',
        'HOST': 'db',
        'PORT': '5432',
    }
}
```
I've written a blog post that expands on this a bit.
https://bordeltabernacle.github.io/2015/09/03/notes-on-django-setting-up.html
