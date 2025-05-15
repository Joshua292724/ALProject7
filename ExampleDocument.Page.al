page 50127 "Example Document"
{
    PageType = Document;
    UsageCategory = Documents;
    SourceTable = ExampleHeader;
    Caption = 'Example Document';

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
            }
            part(ExampleLineSubpage;"Example Line Subpage")
            {
                SubPageLink = "Document No." = field("No.");
                      ApplicationArea = All;
            }
        }
    }
}