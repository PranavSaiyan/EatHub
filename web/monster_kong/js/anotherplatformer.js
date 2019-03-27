var game = new Phaser.Game(350,600,Phaser.AUTO);
var GameState = {
    init:function () {
     this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
     this.scale.pageAlignHorizontally=true;
     this.scale.pageAlignVertically=true;
    },
    preload:function () {
        this.load.image('gorilla','assets/images/gorilla3.png');
        this.load.image('platform','assets/images/platform.png');
    },
    create:function () {
      this.stage.backgroundColor = "#66f";
      //physics
      this.physics.startSystem(Phaser.Physics.ARCADE);
      //camera and platform tracking
        this.cameraYMin = 99999;
        this.platformYMin = 99999;
      //create platform
      this.platformCreate();
      //create hero
      this.heroCreate();
      //cursor controls
        this.cursor= this.input.keyboard.createCursorKeys();
    },
    update:function () {

    },
    platformCreate:function () {
        this.platforms = this.add.group();
        this.platforms.enableBody = true;
        this.platforms.createMultiple(10,'platform');
        //create a base platform
        this.platformCreateOne(-16,this.world.height-16,this.world.width+16);
        for(var i=0;i<9;i++){
            this.platformCreateOne(this.rnd.integerInRange(0,this.world.width-50),this.world.height-100-100*i,50);
        }
    },
    platformCreateOne:function (x, y, width) {
        // this is a helper function since writing all of this out can get verbose elsewhere
        var platform  = this.platforms.getFirstDead();
        platform.reset(x,y);
        platform.scale.x=width;
        platform.scale.y=16;
        platform.body.immovable=true;
        return platform;
    },
    heroCreate:function () {
        this.hero =  this.game.add.sprite(this.world.centerX,this.world.height-36,'gorilla');
        this.hero.anchor.setTo(0.5);
        this.hero.ychange=0;
        this.hero.yOrig= this.hero.y;

        this.physics.arcade.enable(this.hero);
        this.hero.body.gravity.y=500;
        this.hero.body.checkCollision.up=false;
        this.hero.body.checkCollision.left=false;
        this.hero.body.checkCollision.right=false;
    }

};
game.state.add('GameState',GameState);
game.state.start('GameState');