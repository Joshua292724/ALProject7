page 50125 "Example Card"
 {
     PageType = Card;
     UsageCategory = None;
     SourceTable = Example;
     Caption = 'Example Card';


     layout
     {
         area(Content)
         {
             group(General)
             {
                 Caption = 'General';

                 field("No."; Rec."No.")
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the No. field.';
                     trigger OnAssistEdit()
                     begin
                         if Rec.AssistEdit(xRec) then
                             CurrPage.Update();
                     end;
                 }
                 field(Description; Rec.Description)
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the Description field.';
                 }
                 field("Example Type Code"; Rec."Example Type Code")
                 {
                     ApplicationArea = All;
                     ToolTip = 'Specifies the value of the Example Type Code field.';
                 }
             }
         }
     }
 }