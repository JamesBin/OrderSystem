<%@ attribute name="direction" %>
<%@ attribute name="properties" %>
<%@tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .sort {
        cursor: pointer;
    }
</style>

<input type="hidden" name="default_properties" value="${properties}"/>
<input type="hidden" name="default_direction" value="${direction}"/>

<input type="hidden" name="properties" value="${param['properties']}">
<input type="hidden" name="direction" value="${param.direction}">


<content tag="sortScript">
    <script>
        $(function () {
            $('.sort').append('<i class = "fa fa-sort"></i>');
            $('.sort').attr('data-direction', "");

            var direction = $('[name = "direction"]').val();
            var properties = $('[name = "properties"]').val();

            var default_properties = $('[name=default_properties]').val();
            var default_direction = $('[name=default_direction]').val();
            if (properties == '' && default_properties != '') {
                properties = default_properties;
                direction = default_direction;
                $('[name = "direction"]').attr("value", direction);
                $('[name = "properties"]').attr("value", properties);
            }

            if (direction == 'ASC') {
                $('[data-filed="' + properties + '"]').attr('data-direction', 'ASC');
                $('[data-filed="' + properties + '"]').find('i').remove();
                $('[data-filed="' + properties + '"]').append('<i class = "fa fa-sort-asc"></i>');
            }
            if (direction == 'DESC') {
                $('[data-filed="' + properties + '"]').attr('data-direction', 'DESC');
                $('[data-filed="' + properties + '"]').find('i').remove();
                $('[data-filed="' + properties + '"]').append('<i class = "fa fa-sort-desc"></i>');
            }

            $('.sort').on('click', function () {
                var filed = $(this).attr('data-filed');
                var direct = $(this).attr('data-direction');
                if (direct == '') {
                    $('[name = "properties"]').attr("value", filed);
                    $('[name = "direction"]').attr("value", "ASC");
                }
                if (direct == 'ASC') {
                    $('[name = "properties"]').attr("value", filed);
                    $('[name = "direction"]').attr("value", "DESC");
                }
                if (direct == 'DESC') {
                    $('[name = "properties"]').attr("value", filed);
                    $('[name = "direction"]').attr("value", "ASC");
                }
                $('form').submit();
            });
        });
    </script>
</content>