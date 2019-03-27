/**
 * Created by user on 11/15/2017.
 */
var game = new Phaser.Game(350,600,Phaser.AUTO);
var GameState={
    init:function () {
        this.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL;
        this.scale.pageAlignHorizontally=true;
        this.scale.pageAlignVertically=true;



        this.game.physics.startSystem(Phaser.Physics.ARCADE);
        this.game.physics.arcade.gravity.y=600;
        this.game.world.setBounds(0,0,350,650);

        this.cursors = this.game.input.keyboard.createCursorKeys();
        this.RUNNING_SPEED = 130;
        this.JUMPING_SPEED = 400;
    },
    preload:function () {
        this.load.image('barrel','assets/images/barrel.png');
        this.load.image('gorilla','assets/images/gorilla3.png');
        this.load.image('actionbutton','assets/images/actionButton.png');
        this.load.image('arrowbutton','assets/images/arrowButton.png');
        this.load.image('ground','assets/images/ground.png');
        this.load.image('platform','assets/images/platform.png');

        this.load.spritesheet('fire','assets/images/fire_spritesheet.png',20,21,2,1,1);
        this.load.spritesheet('player','assets/images/player_spritesheet.png',28,30,5,1,1);
        this.load.text('level','assets/data/level1.json');

    },
    create:function () {
        this.ground = this.add.sprite(0,580,'ground');
        this.game.physics.arcade.enable(this.ground);
        this.ground.body.immovable=true;
        this.ground.body.allowGravity=false;
        //parse the json
        this.levelData =  JSON.parse(this.game.cache.getText('level'));
        console.log(this.levelData);

        // var platformData = [
        //     {"x":0,"y":500},
        //     {"x":45,"y":410},
        //     {"x":90,"y":320},
        //     {"x":0,"y":210}
        // ];
        this.fires= this.add.group();
        this.fires.enableBody=true;
        var fire;
        this.levelData.fireData.forEach(function (element) {
            fire  =this.fires.create(element.x,element.y,'fire');
            fire.animations.add('firey',[0,1],4,true);
            fire.play('firey');
        },this);

        this.fires.setAll('body.allowGravity',false);

        this.platforms  = this.add.group();
        this.platforms.enableBody = true;

        this.levelData.platformData.forEach(function (element) {
            this.platforms.create(element.x,element.y,'platform');
        },this);

        this.platforms.setAll('body.immovable',true);
        this.platforms.setAll('body.allowGravity',false);

        this.gorilla = this.add.sprite(this.levelData.gorilla.x,this.levelData.gorilla.y,'gorilla');
        this.gorilla.anchor.setTo(0.5);
        this.game.physics.arcade.enable(this.gorilla);
        this.gorilla.body.allowGravity=false;

        this.player = this.add.sprite(this.levelData.playerStart.x,this.levelData.playerStart.y,'player',3);
        this.player.anchor.setTo(0.5);
        this.player.customParams={mustJump:false,left:false,right:false};
        this.player.animations.add('walking',[0,1,2,1],6,true);

        //this.player.play('walking');
        this.game.physics.arcade.enable(this.player);
        this.player.body.collideWorldBounds=true;
        //camera
        this.game.camera.follow(this.player);
        this.createOnscreencontrols();

        this.barrels =  this.add.group();
        this.barrels.enableBody  = true;
        this.createBarrel();
        this.barrelCreator  =  this.game.time.events.loop(Phaser.Timer.SECOND*this.levelData.barrelFrequency,this.createBarrel,this);
        

    },
    update:function () {
        this.game.physics.arcade.collide(this.ground,this.player,this.landed);
        this.game.physics.arcade.collide(this.player,this.platforms,this.landed);
        this.game.physics.arcade.overlap(this.player,this.fires,this.killThePlayer);
        this.game.physics.arcade.overlap(this.player,this.barrels,this.killThePlayer);
        this.game.physics.arcade.overlap(this.player,this.gorilla,this.win);
        this.game.physics.arcade.collide(this.ground,this.barrels);
        this.game.physics.arcade.collide(this.platforms,this.barrels);


        this.player.body.velocity.x=0;
        if(this.cursors.right.isDown || this.player.customParams.right){
            this.player.body.velocity.x=this.RUNNING_SPEED;
            this.player.scale.setTo(-1,1);
            this.player.play('walking');
        }
        else if (this.cursors.left.isDown || this.player.customParams.left){
            this.player.body.velocity.x=-this.RUNNING_SPEED;
            this.player.scale.setTo(1,1);
            this.player.play('walking');
        }
        else {
            this.player.animations.stop();
            this.player.frame=3;
        }

        if((this.cursors.up.isDown || this.player.customParams.mustJump )&& this.player.body.touching.down){
            this.player.body.velocity.y=-this.JUMPING_SPEED;
            this.player.customParams.mustJump=false;
        }

        this.barrels.forEach(function (element) {
            if (element.x<10 && element.y>=550){
                element.kill();
            }
        },this);
    },
    landed:function () {
       // console.log('LAnded');
    },
    createOnscreencontrols:function () {
        this.leftArrow = this.game.add.button(20,550,'arrowbutton');
        this.rightArrow = this.game.add.button(100,550,'arrowbutton');
        this.actionbutton = this.game.add.button(280,550,'actionbutton');
        this.leftArrow.alpha=0.5;
        this.rightArrow.alpha=0.5;
        this.actionbutton.alpha=0.5;
        this.leftArrow.fixedToCamera=true;
        this.rightArrow.fixedToCamera=true;
        this.actionbutton.fixedToCamera=true;

        //jump
        this.actionbutton.events.onInputDown.add(function () {
            this.player.customParams.mustJump = true;
        },this);

        this.actionbutton.events.onInputUp.add(function () {
            this.player.customParams.mustJump = false;
        },this);
        //left
        this.leftArrow.events.onInputDown.add(function () {
            this.player.customParams.left=true;
        },this);

        this.leftArrow.events.onInputUp.add(function () {
            this.player.customParams.left=false;
        },this);
        //right
        this.rightArrow.events.onInputDown.add(function () {
            this.player.customParams.right=true;
        },this);
        this.rightArrow.events.onInputUp.add(function () {
            this.player.customParams.right=false;
        },this);
    },
    killThePlayer:function (player,fire) {
        console.log('Killed Player');
        game.state.start('GameState');
    },
    win:function (player, gorilla) {
        alert('You Win !');
        game.state.start('GameState');
    },
    createBarrel:function () {
        var Barrel = this.barrels.getFirstExists(false);
        if(!Barrel){
            Barrel = this.barrels.create(0,0,'barrel');
        }
        Barrel.body.collideWorldBounds=true;
        Barrel.body.bounce.setTo(1,0);
        Barrel.reset(this.levelData.gorilla.x,this.levelData.gorilla.y);
        Barrel.body.velocity.x  = -this.levelData.barrelSpeed;
    }
    
};
game.state.add('GameState',GameState);
game.state.start('GameState');
