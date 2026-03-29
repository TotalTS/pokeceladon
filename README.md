# Pokémon Celadon Version

This hack tries to be a little upgrade from Red/Blue/Green without being too ambitious. Mostly the whole game has graphic updates and some new events.
Started this project a long time ago and some ideas changed, but I'm commited to finish it now: https://web.archive.org/web/20180903101807/https://hax.iimarckus.org/topic/7257/

Why Celadon Version?:
Celadon City is my favorite city in Gen 1, this is a very personal hack.

To patch the ROM, Beat Patcher is recommended. https://www.romhacking.net/utilities/893/

Features:

- New sprites.
- New party menu icons ported from Gen 2.
- New palettes.
- New Super Gameboy border.
- Gender selection.
- New item Skateboard, use it to go as fast as Bike and jump ledges in reverse.
- You can press SELECT to switch Pokémon in your party menu.
- You can press B to move faster while walking, cycling, or swimming.
- You can talk to use SURF, CUT, STRENGTH.
- You can have all starters like in Pokémon Yellow.
- Lapras and Pikachu have unique sprites for SURF.
- If you have badge(s) Guards have shorter texts on Route 23.
- Nurse at Silph Co. 9F still heals you after beating Giovanni.
- Mew under the truck.
- New trainer classes Rookie and Yujirou. (From prototypes)
- You can battle Yujirou before Brock at Route 22 Gate 2F. He will give you TM19 to make the battle against Brock easier if you have a Charmander as starter.
- You can make Erik and Sara meet again at Safari Zone. Doing so will unlock free pass to it.
- New Celadon University location, where you can get a Magikarp with Dragon Rage and a Celadon University Diploma.
- You can have a Rocket Suit after beating the Nugget Bridge. (Optional) Use it to skip battles against the Team Rocket. You can also use it to catch enemy's Pokémon. (But it ends the battle instantly)
- In Rock Tunnel, there's an NPC that uses FLASH for you without need to learn the HM.
- Restored PC on Celadon Hotel.
- Added USE/QUIT before throwing PokéBalls.

Post game events:

- Currently, there are 2 versions of Celadon based on Red and Blue. The player can choose if they want their experience to be closer to og Red or og Blue versions, both versions have 151 Pokémon catchable post game.
- S.S. Anne returns with new trainers.
- New Areas to explore and complete the Pokédex: Bill's Garden, Mystery Cave, Route 1 East/West, Route 0 East/West, Route 21 East/West.
- At Celadon Hotel, you can select a new home in any city you want. (Plus the Summer Beach House from Yellow on Route 19) You will receive random visits every time you enter.
- At your new home, Bill will visit you randomly and give you access to Bill's Garden. There's also a low chance that a Pidgey spawns on the house near the stairs, it will give you some random gifts.
- Before visiting Bill's Garden, you can search for a Long House at Route 25, where you can get the Skateboard.
- Rematch the Gym Leaders as much as you want. (Giovanni is replaced by Yujirou)
- If you have all 151 Pokémon catched, you will battle with Professor Oak at the Pokémon League.

# Screenshots

![0001](screenshots/0001.bmp)
![0002](screenshots/0002.bmp)
![0003](screenshots/0003.bmp)
![0004](screenshots/0004.bmp)
![0005](screenshots/0005.bmp)
![0006](screenshots/0006.bmp)
![0007](screenshots/0007.bmp)
![0008](screenshots/0008.bmp)
![0009](screenshots/0009.bmp)
![0010](screenshots/0010.bmp)
![0011](screenshots/0011.bmp)
![0012](screenshots/0012.bmp)

# Credits

**Narishma-gb, Sylvie, Pan Docs files, superfamiconv** (HELPED A LOT with 4bpp adaptation used to built it.)
- SGB Border.

**Sylvie**
- Talk to use SURF, CUT, STRENGTH.
- Ported Charmander, Squirtle, Bulbasaur givers.
- Polished Map.

**Pigu-A**
- Battle with Professor Oak.

**Pigu-A, luckytyphlosion, and Vortyne**
- Mew under the truck.

**Vortyne**
- Lapras can Surf in Fuchsia City.
- New trainer class Rookie.
- Press SELECT to switch Pokémon in your party menu.
- Optimization on Home bank.
- Move badge "item" definitions outside actual item list.

**Mr. Cheeze**
- Music: VS Mew.

**cRz-Shadows**
- New party icons code.

**Sanqui and Dannye**
- For pokered-crysaudio used for this project

**Dannye**
- Surf with Lapras, Seel, Pikachu.

**PokefanMarcel**
- Now on Champion's House you can have random visits. (this code is based on MtMoonSquare_Script on his hack yumepokered)

**Jojobear**
- Run animation.

**ShiraTheMogul**
- Fixing STRENGTH overworld bug.

**Tobias_Levi**
- Female trainer front sprite and backsprite.

**LuigiTKO**
- Articuno, Zapdos, Moltres, Mew, Mewtwo overworld sprites.

**pret tutorials**
- Add a new map sprite
- Adding gym leader rematches
- Adding Gender Selection (original tutorial done by **Luna**)
- Add debug mode to Red version
- Restore the invisible PC in the Celadon Hotel

# Pokémon Red and Blue [![Build Status][ci-badge]][ci]

This is a disassembly of Pokémon Red and Blue.

It builds the following ROMs:

- Pokemon Red (UE) [S][!].gb `sha1: ea9bcae617fdf159b045185467ae58b2e4a48b9a`
- Pokemon Blue (UE) [S][!].gb `sha1: d7037c83e1ae5b39bde3c30787637ba1d4c48ce2`
- BLUEMONS.GB (debug build) `sha1: 5b1456177671b79b263c614ea0e7cc9ac542e9c4`
- dmgapae0.e69.patch `sha1: 0fb5f743696adfe1dbb2e062111f08f9bc5a293a`
- dmgapee0.e68.patch `sha1: ed4be94dc29c64271942c87f2157bca9ca1019c7`

To set up the repository, see [**INSTALL.md**](INSTALL.md).


## See also

- [**Wiki**][wiki] (includes [tutorials][tutorials])
- [**Symbols**][symbols]
- [**Tools**][tools]

You can find us on [Discord (pret, #pokered)](https://discord.gg/d5dubZ3).

For other pret projects, see [pret.github.io](https://pret.github.io/).

[wiki]: https://github.com/pret/pokered/wiki
[tutorials]: https://github.com/pret/pokered/wiki/Tutorials
[symbols]: https://github.com/pret/pokered/tree/symbols
[tools]: https://github.com/pret/gb-asm-tools
[ci]: https://github.com/pret/pokered/actions
[ci-badge]: https://github.com/pret/pokered/actions/workflows/main.yml/badge.svg
