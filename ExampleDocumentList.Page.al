page 50130 "Example Document List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ExampleHeader;
    Caption = 'Example Document List';
    Editable = false;
    CardPageId = "Example Document";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
            }
        }
    }
}