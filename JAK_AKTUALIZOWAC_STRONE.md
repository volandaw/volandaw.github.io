# Jak aktualizować stronę volandaw.github.io

## Gdzie jest strona
- Folder na dysku: `C:\Users\awolski\Desktop\Aplikacje, SOWy, DNA,\ETYKA i biznes`
- Pliki treści (do edycji): folder `docs\` w środku (np. `docs\index.md`, `docs\o-mnie.md`)
- Strona na żywo: https://volandaw.github.io/

## Jak działa ten projekt (żeby się nie pogubić)
- Piszesz treść w plikach `.md` (zwykły tekst z prostym formatowaniem)
- Program `mkdocs` zamienia te pliki na gotową stronę (HTML)
- Ta gotowa strona trafia na gałąź `gh-pages` na GitHubie — to właśnie ją widzą odwiedzający
- Osobno, `main` na GitHubie trzyma kopię plików źródłowych `.md` — do wglądu i historii, nie jest tym co się wyświetla

## Zwykła aktualizacja treści (np. zmiana tekstu)

**Sposób najprostszy — jedno kliknięcie:**
1. Zmień tekst w pliku `.md` w folderze `docs\` (otwórz w VS Code, zmień, zapisz — Ctrl+S)
2. Kliknij dwukrotnie plik **AKTUALIZUJ_STRONE.bat** (w głównym folderze projektu)
3. Poczekaj, aż okienko napisze "Gotowe!" i zamknij je
4. Sprawdź stronę: volandaw.github.io (twarde odświeżenie: Ctrl+Shift+R)

**Sposób ręczny — jeśli plik .bat nie zadziała:**
1. Otwórz terminal (PowerShell) w folderze projektu (prawy klawisz na pustym miejscu → "Otwórz w terminalu")
2. Wpisz: `conda activate 0d_zera_do_ai`
3. Wpisz: `python -m mkdocs gh-deploy --force`
4. (opcjonalnie, żeby GitHub miał kopię źródeł) wpisz kolejno:
   - `git add -A`
   - `git commit -m "opis zmiany"`
   - `git push origin main`

## Rzeczy, o których warto pamiętać
- Zawsze pracuj na plikach w folderze `...\ETYKA i biznes\docs\` — to jest jedyne prawdziwe źródło strony
- Nie edytuj bezpośrednio plików `.html` na GitHubie w gałęzi `gh-pages` — to gotowy, wygenerowany produkt; ręczna zmiana tam zniknie przy następnej publikacji z lokalnych plików
- Jeśli terminal pisze "nie znaleziono Python" — najpierw wpisz `conda activate 0d_zera_do_ai`
