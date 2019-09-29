typedef unsigned int uint;
typedef unsigned char uchar;

#define NUM_CLASS 9
#define NUM_CLASS_TALENT_TREES 3

typedef struct node {
    uint row;
    uint col;
    uint id;
    uint repRow;
    uint reqCol;
    uint reqId;
    uint spellId[5];
    char * texture;
    /*cal later*/
    uint reqedRow;
    uint reqedCol;
    uint reqedId;
}node;

char * className[9] = {
    "druid",
	"hunter",
	"mage",
	"paladin",
	"priest",
	"rogue",
	"shaman",
	"warlock",
	"warrior",
};



