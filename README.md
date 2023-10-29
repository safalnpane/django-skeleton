# Django-skeleton
Quick setup Django project.

**Make sure you have `make` installed**

1. Start by cloning the repo:
```bash
git clone git@github.com:safalnpane/Django-skeleton > /path/to/your/project/project_name
```
2. `cd` into the `project_name` directory.
3. Setup the `venv`.
*The `Makefile` looks for a `PROJECT_NAME` environment variable.*
```bash
export PROJECT_NAME="your-project-name"
make venv
```
4. I suggest you create the alias for activating the venv.
5. Setup Django project:
```bash
# You need to activate venv for this.
make django
```
6. Activate `venv` and start working.
```bash
# If you've setup the alias, then:
activate
# If not, then:
source /path/to/your/venv/bin/activate
```

## Useful operations with `Make`
- Delete the `venv` directory.
```bash
make cleanvenv
```
- Create Django app
```bash
make app NAME=your_app_name
```
- Run django server
```bash
make run
```
- Run `makemigrations`
```bash
make migrations
```
- Run `migrate`
```bash
make migrate
```
- If you already have a `requirements.txt`, you can install it with:
```bash
make install
```
