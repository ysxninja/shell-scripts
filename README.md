![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=black&color=purple)

### How to install?
* copy shell script to your ~/.local/bin
* install required programs for respective scripts

### 🐚Scripts
* Ultimate pull (req git+patch/diff)
   - [x] fetch origin
   - [x] show diff/patch
   - [x] add option rebase/merge/pull
   -   > (fetch origin and shows diff/patch), with option for rebase/merge/pull

* Config Editor (req fzf+$EDITOR variable)
   - [x] edit all configs from the confort of one command (cfz)
   - [x] finetuned editing (cf)
   -   > need more configs for cf? edit for your respective system spec do a pull or issue

* Shell source script(sh-sauce/sauce)
   - [x] fast easy environment variable sourcing

* Ultimate Push (req git)
   - [x] push and commit to github repos

* Proton (req proton-cli):
   - [x] proton connection 
   - [x] killswitch conf 
   - [x] proton termination
   - [x] proton status check

* Folder Mount (req udisksctl)
   - [x] external Folder Mount without root access

* Serial Number Scripts (snwithzenity req zenity)
   - [x] print system serial numbers

### `System-Info`:
   Information the script reads from dmidecode bios table.
  1. Ram Size on both slots.
  2. Rom Size.
  3. Processor type & clock speed.
  4. Ram Speed.
  5. Manufacturer information.
  6. Os Architecture.
  7. Maximum supported Ram size.
  8. Ram Type.
  9. Serial Number.
  10. No of cpu Cores.
   
   #### `Installation instructions:`
   1. clone this repo into your local machine.
   2. Copy the following command and paste in your terminal.

```import copy from 'copy-to-clipboard'
bin_path="/usr/local/bin/sysinfo";
cd shell-scripts/System-Info;
chmod +x ./sysinfo.sh;
ln -sv $(pwd)/sysinfo.sh $bin_path && unset bin_path;
```
Now after that is all done, your new command will be `sysinfo`. Anytime you want to query for system information, `sysinfo` will be go to command. Yay!
  
![](https://media.giphy.com/media/FlWgXEtj5aM5G/giphy.gif)
