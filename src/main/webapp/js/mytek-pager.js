(function ($) {

    var _recordCount = 20;
    var _this = this;
    var _index = 1;
    var _size = 20;
    var _maxLinkCount = 5;

    this.setPageIndex = function (index) {
        _index = index;
    }

    this.setSize = function (size) {
        if (_size < 1)
            _size = 20;
        else
            _size = size;
    }

    this.getRecordCount = function () {
        return _recordCount;
    }

    this.setRecordCount = function (v) {
        _recordCount = v;
    }

    this.getPageSize = function () {
        return _size;
    }

    this.getPageIndex = function () {

        if (_index > 0)
            return _index;
        else
            return 1;
    }

    this.getNextPageIndex = function () {
        if (_this.getPageIndex() < _this.getPageCount())
            return parseInt(_this.getPageIndex()) + 1;
        else
            return _this.getPageIndex();
    }

    this.getPrevPageIndex = function () {
        if (_this.getPageIndex() > 1)
            return parseInt(_this.getPageIndex()) - 1;
        else
            return _this.getPageIndex();
    }

    this.getPageCount = function () {

        if (_recordCount == 0)
            return 0;

        if (_recordCount <= _size)
            return 1;

        var _count = Math.floor(_recordCount / _size);

        if (_recordCount % _size > 0)
            _count = _count + 1;

        return _count;
    }

    this.toHtml = function () {

        var begin = 1;
        var end = begin + _maxLinkCount;

        var b = _this.getPageIndex() > (Math.floor(_maxLinkCount / 2)); //前面
        var e = _this.getPageIndex() > (parseInt(_this.getPageCount()) - (Math.floor(_maxLinkCount / 2))); //后面

        if (b) {
            begin = parseInt(_this.getPageIndex()) - (Math.floor(_maxLinkCount / 2));
            end = begin + _maxLinkCount;
        }
        if (e) {
            begin = parseInt(_this.getPageCount()) - _maxLinkCount + 1;
            end = begin + _maxLinkCount;
        }

        if (begin <= 0)
            begin = 1;

        if (end >= parseInt(_this.getPageCount()) + 1)
            end = parseInt(_this.getPageCount()) + 1;

        //如果页面少于
        if (_maxLinkCount >= _this.getPageCount()) {
            begin = 1;
            end = parseInt(_this.getPageCount()) + 1;
        }

        var html = "<div>共 <span  class='label label-info'>" + _this.getRecordCount() + " </span>条信息 ， <span  class='label label-info'>" + _this.getPageCount() + " </span>页</div><div class='pagination'>";

        if (_this.getPageCount() > 1) {

            if (_this.getPageCount() > _maxLinkCount) {
                if (_this.getPageIndex() > 1)
                    html += "<li><a href=\"javascript:\" data-index=\"" + 1 + "\">首页</a></li>";

                if (_this.getPageIndex() > 1)
                    html += "<li><a href=\"javascript:\" data-index=\"" + _this.getPrevPageIndex() + "\">上一页</a></li>";
            }

            for (var i = begin; i < end; i++) {
                if (i == _this.getPageIndex())
                    html += "<li class=\"active\"><a href=\"javascript:\" data-index=\"" + i + "\">" + i + "</a></li>";
                else
                    html += "<li><a href=\"javascript:\" data-index=\"" + i + "\">" + i + "</a></li>";
            }

            if (_this.getPageCount() > _maxLinkCount) {
                if (_this.getPageIndex() < _this.getPageCount())
                    html += "<li><a href=\"javascript:\" data-index=\"" + _this.getNextPageIndex() + "\">下一页</a></li>";

                if (_this.getPageIndex() < _this.getPageCount())
                    html += "<li><a href=\"javascript:\" data-index=\"" + _this.getPageCount() + "\">尾页</a></li>";
            }
        }

        html += "</div>"

        return html;
    }

    var methods = {
        init: function (options) {
            var opts = $.extend({ pageSize: 20, onChange: function () { } }, options);
            _this.setSize(opts.pageSize);
            var me = $(this);
            me.on("click", "a[data-index]", function () {
                var index = $(this).data("index");
                if (opts.onChange) {
                    _this.setPageIndex(index);
                    opts.onChange(index, _size);
                }
            });
        },
        setTotalCount: function (recordCount) {
            var me = $(this);
            _this.setRecordCount(recordCount);
            me.html(_this.toHtml());
        },

        getPageIndex: function () {
            return _this.getPageIndex();
        },

        getPageSize: function () {
            return _this.getPageSize();
        }
    }

    $.fn.Pager = function (m) {
        if (methods[m]) {
            return methods[m].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof m === 'object' || !m || m instanceof Array) {
            return methods.init.apply(this, arguments);
        } else {
            $.error('Method ' + m + ' does not exist on jQuery.Pager');
        }
    }
})(jQuery);