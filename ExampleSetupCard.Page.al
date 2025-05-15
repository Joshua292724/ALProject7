page 50101 ExampleSetupCard
{
    ApplicationArea = All;
    Caption = 'Example Setup Card';
    PageType = Card;
    SourceTable = "Example Setup";
    UsageCategory = Administration;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Example Nos."; Rec."Example Nos.")
                {
                    ToolTip = 'Specifies the value of the Example Nos. field.';
                }
                field("Document Nos."; Rec."Document Nos.")
                {
                    ToolTip = 'Specifies the value of the Document Nos. field.';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not rec.get() then
            rec.Insert();
    end;
}