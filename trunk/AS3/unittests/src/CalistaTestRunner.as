﻿/*

  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at 
  
           http://www.mozilla.org/MPL/ 
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the License. 
  
  The Original Code is VEGAS Framework.
  
  The Initial Developer of the Original Code is
  ALCARAZ Marc (aka eKameleon)  <vegas@ekameleon.net>.
  Portions created by the Initial Developer are Copyright (C) 2004-2010
  the Initial Developer. All Rights Reserved.
  
  Contributor(s) :
  
*/

package  
{
    import buRRRn.ASTUce.Runner;
    import buRRRn.ASTUce.config;
    
    import calista.AllTests;
    
    import system.console;
    import system.diagnostics.TextFieldConsole;
    
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    [SWF(width="780", height="700", frameRate="24", backgroundColor="#666666")]
    
    /**
     * The main Calista TestRunner launcher.
     * Note: -default-size 780 700 -default-frame-rate 31 -default-background-color 0x666666 -target-player=10.0
     */
    public class CalistaTestRunner extends Sprite
    {
        public function CalistaTestRunner()
        {
            // init
            
            stage.align     = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            textfield                   = new TextField() ;
            textfield.defaultTextFormat = new TextFormat( "Courier New" , 14 , 0xFFFFFF ) ; 
            textfield.multiline         = true ;
            textfield.selectable        = true ;
            textfield.wordWrap          = true ;
            
            addChild( textfield ) ;
            
            stage.addEventListener( Event.RESIZE , resize ) ;
            resize() ;
            
            console = new TextFieldConsole( textfield ) ;
            
            // ASTUce
            
            buRRRn.ASTUce.config.allowStackTrace     = false ;
            buRRRn.ASTUce.config.maxColumn           = 62 ;
            buRRRn.ASTUce.config.showConstructorList = false ;
            
            // run tests
           
            Runner.main( calista.AllTests );
        }
        
        /**
         * The debug textfield of this application.
         */
        public var textfield:TextField ;
        
        /**
         * Invoked to resize the application content.
         */
        public function resize( e:Event = null ):void
        {
            textfield.width  = stage.stageWidth ;
            textfield.height = stage.stageHeight ;
        }
    }
}
