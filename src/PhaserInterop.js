import {Scene} from "phaser"


//this is an ugly, but also easy way to use
//the base scene class functionally 
class SceneExt extends Scene {
    constructor(conf,preload,create,update){
        super(conf);
        this.p = preload;
        this.c = create;
        this.u = update;
    }
    //Using the instance as a parameter is not
    //good design, but it does get the job done.
    //I would prefer a more functional javascript game
    //framework but there aren't many alternatives
    preload(){
        this.p(this);
    }

    create(){
        this.c(this);
    }
    update(time,delta){
        this.u(this,time,delta);
    }

}

//factory functions for purescript
export function createScene (sceneConfig, p, c, u) {
    return new SceneExt(sceneConfig, p, c, u);
}

export function createGame (gameConfig){
    return new Game(gameConfig);
}