## For MAC OS
1. Rename it to pytime (no .py extension)
    ```bash   
    mv pytime.py pytime 
   ```
2. Move it to a directory in your ```$PATH```
   - You should move it to something like ```~/bin``` or ```/usr/local/bin```:
        ```bash
        mkdir -p ~/bin
        mv pytime ~/bin/
        ```
   - Then, add this to your shell profile (```~/.zshrc``` or ```~/.bash_profile```):
        ```bash
        export PATH="$HOME/bin:$PATH"
        ```
    Then reload:
    ```bash
    source ~/.zshrc    # or ~/.bash_profile
    ```
### Usage: 
Anywhere on your system:

```python
pytime <filename.py>
```
