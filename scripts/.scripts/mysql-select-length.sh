

#!/bin/bash






echo "SELECT $2, CHAR_LENGTH($2) AS 'character length' FROM $1 WHERE CHAR_LENGTH($2)>20;" | pbcopy
