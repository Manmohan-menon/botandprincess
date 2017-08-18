# botandprincess

this is basically about a bot named lancebot saving the princess in level 1 and level 2

task summary : 
 Princess Peach is trapped in one of the four corners of a square grid. You are in the center of the grid and can move one step at a time in any of the four directions. how to save the princess?


level 1 Explanation:
in the first case its basically for 3*3 grid

- for first example paste this code in sirlancebot.rb file at the bottom :

```
sir_lancebot = SirLancebot.new(3, ['---', '-l-', '--p'])

sir_lancebot.princess_path
```
- and then simply execute the file by running:
`ruby sir_lancebot.rb`

```
sample input:
3
---
-l-
--p
```

```
sample output:
DOWN
RIGHT
```

level 2 Explanation:
in the second case its when Princess and Lancebot's position are randomly set. how to save princess

- for second example paste this code in sirlancebot.rb file at the bottom :

```
sir_lancebot = SirLancebot2.new('5', '2 1',['-----', '-----','-l--p', '-----','-----'])
sir_lancebot.next_move

```
- and then simply execute the file by running:
`ruby sir_lancebot_returns.rb`


```
sample input:
5
2 1
-----
-----
-l--p
-----
-----
```

```
sample output:
RIGHT
```

* Gems used:
    * rspec: for writing testcases  
    * yard: for documentation  
	* rubocop: for syntax linting and static code analyzer
