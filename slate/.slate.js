// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true
});

// Declare our screen corners
var upperLeft = S.op("corner", {
  "direction" : "top-left",
  "width" : "screenSizeX/2",
  "height" : "screenSizeY/2"
});

var upperRight = upperLeft.dup({ "direction" : "top-right"});
var bottomLeft = upperLeft.dup({ "direction" : "bottom-left"});
var bottomRight = upperLeft.dup({ "direction" : "bottom-right"});

// And sides
var left = upperLeft.dup({"height": "screenSizeY"});
var right = upperRight.dup({"height": "screenSizeY"});
var top = upperLeft.dup({"width": "screenSizeX"});
var bottom = bottomLeft.dup({"width": "screenSizeX"});

var fullScreen = left.dup({"width": "screenSizeX"});

// Declare our keyboard shortcuts
S.bnda({
  // Basic Location Bindings
  "h:alt,ctrl" : left,
  "j:alt,ctrl" : bottom,
  "k:alt,ctrl" : fullScreen,
  "l:alt,ctrl" : right,

  "u:alt,ctrl" : upperLeft,
  "i:alt,ctrl" : upperRight,
  "m:alt,ctrl" : bottomRight,
  "n:alt,ctrl" : bottomLeft,

  // Focus Bindings
  "l:alt" : S.op("focus", { "direction" : "right" }),
  "h:alt" : S.op("focus", { "direction" : "left" }),
  "k:alt" : S.op("focus", { "direction" : "up" }),
  "j:alt" : S.op("focus", { "direction" : "down" }),
  "i:alt" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  "f:alt" : S.op("hint"),
  "j:cmd" : S.op("hint", {"characters": "jklfdsiauophnqwerzxcv0987654321"}),
  "k:cmd" : S.op("focus", { "direction" : "behind" }),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "g:alt" : S.op("grid")
});

// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");


var retile = function(windowObject) {
  var windows = [];
  slate.eachApp(function(app) {
    app.eachWindow(function(win) {
      if (win.isMinimizedOrHidden()) return;
      if (null === win.title() || win.title() === "") return;
      windows.push(win);
    });
  });

  var ss          = S.screen().rect();
  var windowSizeX = ss.width * 0.4;
  var windowSizeY = ss.height / (windows.length - 1);
  var winPosY     = 0;

  for (i = 0; i < windows.length; i++) {
    w = windows[i];

    if (w.title() == windowObject.title()) {
      mainWidth = (windows.length > 1) ? "screenSizeX*0.6" : "screenSizeX";

      w.doOperation("move", {
        "x": "screenOriginX",
        "y": "screenOriginY",
        "width": mainWidth,
        "height": "screenSizeY"
      });
    }
    else {
      w.doOperation("move", {
        "x": "screenSizeX*0.6",
        "y": winPosY,
        "width": windowSizeX,
        "height": windowSizeY
      });

      winPosY += windowSizeY;
    }
  }
};

// Basic keybinds
slate.bindAll({
  "f:cmd,alt": slate.op("move", {"x": "screenOriginX", "y": "screenOriginY",
    "width": "screenSizeX", "height": "screenSizeY"}),
  "left:cmd,alt": slate.op("push", {"direction": "left", "style":
    "bar-resize:screenSizeX/2"}),
  "right:cmd,alt": slate.op("push", {"direction": "right", "style":
    "bar-resize:screenSizeX/2"}),

  "r:cmd,alt": retile,
  "w:alt": slate.op("hint"),
});
