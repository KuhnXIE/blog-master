package com.gict.studyblog.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.aop.interceptor.AsyncUncaughtExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.AsyncConfigurer;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import java.lang.reflect.Method;
import java.util.concurrent.Executor;

/**
 * 注意：该线程池被所有的异步任务共享，而不属于某一个异步任务
 * 异步任务配置
 * Created by yuri on 2022/5/16.
 */
@Slf4j
@Configuration
public class AsyncConfig implements AsyncConfigurer {

    /*
    使用ThreadPoolTaskExecutor创建了一个线程池，同时设置了以下这些参数：
        核心线程数10：线程池创建时候初始化的线程数
        最大线程数20：线程池最大的线程数，只有在缓冲队列满了之后才会申请超过核心线程数的线程
        缓冲队列200：用来缓冲执行任务的队列
        允许线程的空闲时间60秒：当超过了核心线程出之外的线程在空闲时间到达之后会被销毁
        线程池名的前缀：设置好了之后可以方便我们定位处理任务所在的线程池
        线程池对拒绝任务的处理策略：这里采用了CallerRunsPolicy策略，当线程池没有处理能力的时候，该策略会直接在 execute 方法的调用线程中运行被拒绝的任务；如果执行程序已关闭，则会丢弃该任务
        说明：setWaitForTasksToCompleteOnShutdown（true）该方法就是这里的关键，
             用来设置线程池关闭的时候等待所有任务都完成再继续销毁其他的Bean，这样这些异步任务的销毁就会先于Redis线程池的销毁。
             同时，这里还设置了setAwaitTerminationSeconds(60)，该方法用来设置线程池中任务的等待时间，如果超过这个时候还没有销毁就强制销毁，以确保应用最后能够被关闭，而不是阻塞住
     */

    //自定义线程池
    @Bean(name = "myAsyncTaskExecutor")
    @Override
    public Executor getAsyncExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(10);
        executor.setMaxPoolSize(20);
        executor.setQueueCapacity(200);
        executor.setKeepAliveSeconds(60);
        executor.setThreadNamePrefix("myAsyncTaskExecutor-");
        // 关闭资源
        executor.setWaitForTasksToCompleteOnShutdown(true);
        executor.setAwaitTerminationSeconds(60);
        return executor;
    }

    //异步任务中异常处理
    @Override
    public AsyncUncaughtExceptionHandler getAsyncUncaughtExceptionHandler() {

        return new AsyncUncaughtExceptionHandler() {

            @Override
            public void handleUncaughtException(Throwable arg0, Method arg1, Object... arg2) {
                log.error("==========================" + arg0.getMessage() + "=======================", arg0);
                log.error("exception method:" + arg1.getName());
            }
        };
    }
}
