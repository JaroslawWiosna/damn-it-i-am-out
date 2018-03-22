[![Licence](https://img.shields.io/github/license/JaroslawWiosna/damn-it-i-am-out.svg)](https://github.com/JaroslawWiosna/damn-it-i-am-out/blob/master/LICENSE)
[![Release](https://img.shields.io/github/release/JaroslawWiosna/damn-it-i-am-out.svg?maxAge=3600)](https://github.com/JaroslawWiosna/damn-it-i-am-out/releases)
[![GitHub contributors](https://img.shields.io/github/contributors/JaroslawWiosna/damn-it-i-am-out.svg)](https://github.com/JaroslawWiosna/damn-it-i-am-out/graphs/contributors)
[![Pull Requests](https://img.shields.io/github/issues-pr/JaroslawWiosna/damn-it-i-am-out.svg)](https://github.com/JaroslawWiosna/damn-it-i-am-out/pulls)

# damn-it-i-am-out [![Watchers](https://img.shields.io/github/watchers/JaroslawWiosna/damn-it-i-am-out.svg?style=social&label=Watch)](https://github.com/JaroslawWiosna/damn-it-i-am-out/watchers) [![Star](https://img.shields.io/github/stars/JaroslawWiosna/damn-it-i-am-out.svg?style=social&label=Stars)](https://github.com/JaroslawWiosna/damn-it-i-am-out/stargazers) [![Fork](https://img.shields.io/github/forks/JaroslawWiosna/damn-it-i-am-out.svg?style=social&label=Fork)](https://github.com/JaroslawWiosna/damn-it-i-am-out/network)

Wystarczy wykonać skrypt:

```sh
[user@localhost damn-it-i-am-out]$ ./damn-it-i-am-out.sh
```

...i wpisywać potrzebne dane:

```sh
Nie znaleziono pliku konfiguracyjnego
Proszę podać dane:
[Miasto:] Warszawa
[Imię:] Alicja
[Imię narzędik:] Alicją
[Nazwisko:] Warszawska
[Nazwisko narzędnik:] Warszawską
[Adres:] Piłsudskiego 777/88
[Adres c.d.:] 00-000 Warszawa
[Nazwa pracodawcy:] Zła i okrutna firma Sp. z o. o.
[Adres pracodawcy:] Piłsudskiego 888/99
[Adres pracodawcy c.d.:] 00-000 Warszawa
[Data podpisania umowy dd.mm.rrrr:] 21.12.2017
[Miejsce podpisania umowy:] Warszawa
Pomyślnie wygenerowano plik wypowiedzenie.pdf

```

#   G  R  A  T  U  L  A  C  J  E  !

Oto Twój plik:

[![wypowiedzenie.jpg](https://raw.githubusercontent.com/JaroslawWiosna/damn-it-i-am-out-readme/hosting/wypowiedzenie.jpg)](https://raw.githubusercontent.com/JaroslawWiosna/damn-it-i-am-out-readme/hosting/wypowiedzenie.jpg)

---

### Zanim uruchomisz skrypt

Dobrze jest upewnić się, że **imagemagick** jest zainstalowany.

### Opcja stworzenia pliku konfiguracyjnego

> Jesteś u kresu sił i chcesz złożyć wypowiedzenie? Chcesz zautomatyzować wygenerowanie wypowiedzenia do granic możliwości?

Skrypt oferuje możliwość stworzenia pliku konfiguracyjnego `~/.damn-it-i-am-out.conf.gpg" 
Należy uruchomić skrypt z opcją `create-conf`:

```sh
./damn-it-i-am-out.sh create-conf
```

Po wypełnieniu **formularza** zostanie stworzony zaszyfrowany plik z danymi potrzebnymi do wygenerowania wypowiedzenia.

> Aby skorzystać z tej funkcji konieczne jest zainstalowanie **gpg**

---

### Dlaczego wpisanie **Daty podpisania umowy** jest ważne?


| Pracownik jest zatrudniony:                  | Okres wypowiedzenia wynosi: |
|----------------------------------------------|:---------------------------:|
| krócej niż 6 miesięcy                        | dwa tygodnie                |
| dłużej niż 6 miesięcy, ale krócej niż 3 lata | jeden miesiąc               |
| dłużej niż 3 lata                            | trzy miesiące               |

---

### U W A G A !

**Niniejszy projekt jest żartem.**

Inspiracją jest [ta strona](https://github.com/NARKOZ/hacker-scripts), ktora opisuje skrypty napisane przez człowieka ceniącego swój czas. Zgodnie z jego filozofią **wszystko co zajmuje więcej niż 90 sekund twojego czasu powinno być zautomatyzowane**. Pomyślałem, że szukanie wzoru wypowiedzenia zajmuje więcej niż półtorej minuty.


