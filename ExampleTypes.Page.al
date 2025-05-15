page 50124 "Example Types"
 {
     PageType = List;
     ApplicationArea = All;
     UsageCategory = Lists;
     SourceTable = ExampleType;
     Caption = 'Example Types';
     Editable = true;

     layout
     {
         area(Content)
         {
             repeater(General)
             {

                 field("Code"; Rec."Code")
                 {
                     ToolTip = 'Specifies the value of the Code field.';
                 }
                 field(Description; Rec.Description)
                 {
                     ToolTip = 'Specifies the value of the Description field.';
                 }
             }
         }
     }
 }