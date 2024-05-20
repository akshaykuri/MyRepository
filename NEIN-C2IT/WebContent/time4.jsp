<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link href="styles/kendo.common.min.css" rel="stylesheet" />
    <link href="styles/kendo.default.min.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/kendo.all.min.js"></script>
</head>
<body>
    
        <div id="example" class="k-content">
            <div id="to-do">
                    <input id="datetimepicker" style="width:200px;" />
            </div>
        <script>
            $(document).ready(function () {
                // create DateTimePicker from input HTML element
                $("#datetimepicker").kendoDateTimePicker({
                    value:new Date()
                });
            });
        </script>
        <style scoped>
            #to-do {
                height: 52px;
                width: 221px;
                margin: 30px auto;
                padding: 91px 0 0 188px;
                background: url('../../content/web/datepicker/todo.png') transparent no-repeat 0 0;
            }
        </style>
        </div>

</body>
</html>