# GameMaker 2023.6+ Networking a'la 39dll example

Based on simpler native networking example [gmclan-org/gm_networking](https://github.com/gmclan-org/gm_networking) from same author.

This example adds `39dll.dll`-like functions that boomers (like me) were using around 10-15 years ago (if you remember `readbyte()` or `sendmessage()` then you know what I'm talking about). However, this still uses *native* GM Networking functions, which means it doesn't require any dll anymore, and should work on Windows, Mac, Ubuntu, Android, MacOS, PlayStation, Xbox and Switch (all except HTML5 and Opera, as they require Websockets).

*Created by:* Piotr "gnysek" Gnys ([@gnysek](https://www.github.com/gnysek)) for https://gmclan.org/.

Feel free to use and modify (mentioning in credits is not required, but would be greatly appreciated).

You can find docs on [Wiki](https://github.com/gmclan-org/gm_boomers_networking/wiki).

# Przykład Networkingu a'la 39dll w GameMakerze 2023.6+

Na podstawie naszego przykładu na funkcjach natywnych [gmclan-org/gm_networking](https://github.com/gmclan-org/gm_networking).

Ten przykład dodaje funkcje zupełnie jak za czasów `39dll.dll`, które pamiętają takie stare pryki jak ja (jeśli kojarzysz `readbyte()` czy `sendmessage()` to wiesz o czym mówię). Jednakże, tak naprawdę nadal używamy tutaj *natywnych* funkcji sieciowych GM< co oznacza, że taka gra nie wymaga żadnych zewnętrznych plików dll i powinna działać na Windowsie, Macu, Ubuntu, Androidzie, MacOS, PlayStation, Xboxie i Switchu (wszędzie poza HTML5 i Operą, które wymagają Websocketów).

*Autor:* Piotr "gnysek" Gnys ([@gnysek](https://www.github.com/gnysek)) dla https://gmclan.org/.

Można używać i dowolnie modyfikować (nie musisz wspominać o mnie w creditsach, ale będzie miło, jeśli to zrobisz).

Dokumentację znajdziesz na [Wiki](https://github.com/gmclan-org/gm_boomers_networking/wiki).

---

This example uses `Multiclient launching` by [@tabularelf](https://github.com/tabularelf) - https://github.com/tabularelf/MultiClient .
