import {Scene, Game, AUTO} from "phaser"


//this is an ugly, but also easy way to use
//the base scene class functionally 
class SceneExt extends Scene {
    constructor(conf,preload,create,update){
        super(conf);
        this.p = preload; //preload has signature: () => () => { do stuff here...}
        this.c = create;  //create has signature: () => () => { do stuff here...}
        this.u = update; //update has signature (this) => (time) => (delta) => () => {do stuff here...}
    }
    //Using the instance as a parameter is not
    //good design, but it does get the job done.
    //I would prefer a more functional javascript game
    //framework but there aren't many alternatives
    preload(){
        this.p(this)();
    }

    create(){
        this.c(this)();
    }
    update(time,delta){
        this.u(this)(time)(delta)();
    }

}

//the effect unit counts as its own
//parameter, so it's almost like this function
//is binary instead of unary
export const loggingThis = (a) => () =>
 {console.log("logging this", a);}

//factory functions for purescript
export const createScene = sceneConfig => p => c => u => {
    return new SceneExt(sceneConfig, p, c, u);
}

//I am actually not creating a separate type to represent the game
//Instead it is represented as an Effect Unit. Seems to work (so far)
export const createGame = (gameConfig) => () => {
    return new Game(gameConfig);
}

export const auto = AUTO;