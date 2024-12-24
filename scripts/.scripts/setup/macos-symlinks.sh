
# -------------------------------------------------------------------------------------------------
# Create holders for fast clipboard
# -------------------------------------------------------------------------------------------------

$clipdir=~/clipboard/

mkdir ${clipdir}
touch ${clipdir}cp_backtick.txt
touch ${clipdir}cp_colon.txt
touch ${clipdir}cp_curly_close.txt
touch ${clipdir}cp_curly_open.txt
touch ${clipdir}cp_hyphen.txt
touch ${clipdir}cp_period.txt
touch ${clipdir}cp_plus.txt

# -------------------------------------------------------------------------------------------------
# Mountpoints for ssh
# -------------------------------------------------------------------------------------------------

mkdir -p ~/Projects/Development/MountedSSH

# -------------------------------------------------------------------------------------------------
# Symlinks
# -------------------------------------------------------------------------------------------------

gdrivedir=~/Library/CloudStorage/GoogleDrive-david.diosdado@gmail.com/My\ Drive/
syncdir=${gdrivedir}Computer\ Sync/

ln -s ${myclouddir}Notes ~/Notes
ln -s ${gdrivedir}MAMP\ PRO/MAMP\ PRO ~/Library/Application\ Support/appsolute/MAMP\ PRO
ln -s ${syncdir}FileZilla ~/.config/filezilla
ln -s ~/Library/Application\ Support/Mountain\ Duck/Volumes.noindex ~/Projects/Development/MountedFTP



