package com.gict.studyblog.handler;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResultView {

    private  Integer code;

    private  String msg;

    private  Object data;

    private Long time;

    public static ResultView ok() {
        ResultView resultView = new ResultView();
        resultView.setData(null);
        resultView.setCode(20000);
        resultView.setMsg("操作成功！");
        resultView.setTime(System.currentTimeMillis());
        return resultView;
    }

    public static ResultView ok(Object data) {
        ResultView resultView = new ResultView();
        resultView.setData(data);
        resultView.setCode(20000);
        resultView.setMsg("");
        resultView.setTime(System.currentTimeMillis());
        return resultView;
    }

    public static ResultView error(Integer code, String msg){
        return new ResultView(code, msg);
    }

    private ResultView(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
        this.time=System.currentTimeMillis();
    }

    private ResultView(Integer code, String msg, Object data) {
        this.code = code;
        this.data = data;
        this.msg = msg;
        this.time = System.currentTimeMillis();
    }

}

