# Módulo 3: Git Quick Start

Configurando usuario y email en git

    git config --global user.name "Nombre Usuario"
    git config --global user.email "Correo"
    git config --list

Creando un nuevo proyecto

    git init

Crea un directorio .git para verlo puede usar el comando ls -a
Al realizar un git commit, obtenemos la siguiente respuesta

    git commit 

    On branch master   -> La rama actual

    Initial commit     -> El primer commit

    nothing to commit  -> No hay cambios para commit

Procedemos a agregar un archivo a nuestro proyecto

    touch nuevo.txt

Validar el estado en el que está el arhivo

    git status

    ------------------------------------------------------------
    On branch master
    
    No commits yet

    Untracked files:
    (use "git add <file>..." to include in what will be committed)
            nuevo.txt

    nothing added to commit but untracked files present (use "git add" to track)    

Esto quiere decir que el archivo nuevo.txt no está en el repositorio, por lo cual no se le hace seguimiento a sus cambios por lo que se debe agregar al seguimiento

    git add nuevo.txt

Ahora vemos el estado actual

    git status

    ------------------------------------------------------------
    On branch master

    Changes to be committed:
        new file:   nuevo.txt    -> Se agregó el archivo nuevo.txt al staging area

Para agregar de una vez todos los archivos

    git add .

Agrego los cambios al staging area

    git commit -m "Primer commit"

Ahora validamos el estado.
    
        git status
    
        ------------------------------------------------------------
        On branch master
        nothing to commit, working tree clean

Al agregar contenido a un archivo ya existente y ver el estado

    echo "Esto es una prueba" >> nuevo.txt

    git status

    ------------------------------------------------------------
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
            modified:   nuevo.txt

    no changes added to commit (use "git add" and/or "git commit -a")

Para ver los cambios realizados en el archivo

    git diff

Ahora para agregar los camibos realizados al staging area, debemos agregar el archivo y volver hacer el commit

    git add nuevo.txt
    git commit -m "Segundo commit"

    git status

Procedamos a agregar un nuevo archivo segundo.txt, modificar el archivo nuevo.txt y veamos el estado.

    touch segundo.txt
    echo "Esto es una prueba" >> segundo.txt
    echo "Esto es una prueba" >> nuevo.txt

    git status

    ------------------------------------------------------------
    On branch master
    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git restore <file>..." to discard changes in working directory)
            modified:   nuevo.txt

    Untracked files:
    (use "git add <file>..." to include in what will be committed)
            segundo.txt

    no changes added to commit (use "git add" and/or "git commit -a")

Con esto podemos observar como se hace seguimiento por separado de los archivos, agreguemos todos los archivos 

    git add .
    git status
    ------------------------------------------------------------
    On branch master
    Changes to be committed:
    (use "git restore --staged <file>..." to unstage)
            modified:   nuevo.txt
            new file:   segundo.txt

Podemos hacer un git log para ver los ultimos 10 commits

    git log

Podemos hacer un git log -p para ver los commits con el contenido de los archivos

    git log -p

Tambien podemos listar por usuario

    git log --author="javi cisneros"

**Nota:** Después que un un archivo  a sido agregado una vez, de ahora en adelante hacer el commit en la misma linea se puede hacer de la siguiente manera

    git commit -am "Tercer commit"

# Módulo 4: Git Con GitHub

Creando una nueva branch(rama)

    git branch nueva_rama
    git switch nueva_rama
    git push origin dev
    
 Los archivos que agregues cuando estes en la rama nueva_rama, no se agregaran al repositorio de GitHub, solo a la rama nueva_rama. Incluso tampoco serán visibles a nivel de sistema operativo. 

    git checkout -b nueva-rama
    
## Eliminando una rama

    git branch -d nueva_rama
    git push origin --delete nueva_rama

## Git reset vs Git revert

**Reset** -> Se puede asociar a un rollback. Es decir, si se produce un error en un commit, se puede revertir a ese commit en nuestro ambiente local. ()
**Revert** ->  Agrega un nuevo commit al final de la cadena de commits. 

En resumen, git reset es cuando lo cambios aun estan en local , git revert es cuando ya se han hecho push.

## Git reset
### RESET SOFT:

Borra el commit pero no quita el contenido del archivo.
```
git log --oneline
git reset --soft f60dc2e
```
Si hacer un git status va a ver que hay archivo pendiente de commit.

### RESET HARD:

Restaura los archivos a su estado anterior. (Justo cuando se hizo el commit)

    git reset --hard f60dc2e

## Git revert

Deshace un commit y pusha el cambio al repositorio de GitHub.

    git revert HEAD
    git push 
