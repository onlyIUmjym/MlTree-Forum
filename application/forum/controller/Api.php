<?php
namespace app\forum\controller;

use app\common\model\Comment;
use app\common\model\Plugin;
use app\common\model\Topic;
use app\common\model\User;
use app\forum\controller\Base;

class Api extends Base
{
    /**
     * ApiControllerIndex，输出APILIST
     */
    public function index()
    {
        return json(['code' => 0, 'apilist' => '', 'time' => time()]);
    }

    /**
     * GETTOPICLIST,获取帖子列表
     * @param int $page 输出的页数，由1开始
     * @param string $type 输出的类型，common|essence
     * @return array
     */
    public function getTopicList()
    {
        $topic = new Topic;
        if (request()->isPost()) {
            $data = $topic->TopicList(input('post.page'), input('post.type'), input('post.fid'));
            return outRes(0, ['data' => $data[0], 'pages' => $data[1]], null, 'data');
        }
        $data = $topic->TopicList(1, 'common');
        return outRes(0, ['data' => $data[0], 'pages' => $data[1]], null, 'data');
    }

    /**
     * GETTOPICDATA,获取帖子详细信息
     * @param int $tid 帖子的TID
     * @return array
     */
    public function getTopicData($tid)
    {
        $topic = new Topic;
        $res = $topic->getTopic($tid);

        if (!$res[0]) {
            return outRes(100, $res[1], 0, 'data');
        }
        return outRes(0, $res[1], null, 'data');
    }

    /**
     * GETCOMMENTLIST,获取指定帖子的评论数据
     * @param int $tid 欲获取的帖子
     * @param int $page 页码
     * @return array
     */
    public function getCommentList($tid = 0, $page = 1)
    {
        $comment = new Comment;
        if ($tid == 0) {
            return outRes(0, 'NULL', null, 'data');
        }
        $data = $comment->ListPage($tid, $page);
        if ($data[0]) {
            return outRes(0, ['data' => $data[1], 'pages' => $data[2]], null, 'data');
        }
        return outRes(0, 'NULL', null, 'data');
    }

    /**
     * API鉴权
     * @param string $name 鉴权项目可用,分隔
     * @param int $uid 欲鉴权UID
     * @return bool
     */
    public function auth($name, $uid)
    {
        if (!User::isLogin()) {
            return \outRes(105010, '无权限');
        } elseif (!\fastAuth('admin', session('uid'))) {
            return \outRes(105010, '无权限');
        }
        return outRes(0, fastAuth($name, $uid));
    }

    /**
     * POSTCOMMENT,提交评论
     * @param int $tid 评论的帖子ID
     * @param string $content
     */
    public function postComment()
    {
        if (!User::isLogin()) {
            return outRes(10201, '无权限或未登录');
        }

        $info = input('post.');
        $comment = new Comment;
        return $comment->add($info);
    }

    /**
     * 获取插件静态资源地址
     */
    public function pluginAssets($appSign = null, $url = null)
    {
        if (empty($appSign) && empty($url)) {
            return;
        }
        if (Plugin::isStart($appSign)) {
            $url = strtr($url, '_', '.');
            $path = Plugin::getAppPath($appSign) . 'assets/' . $url;
            if (empty(\cache($path))) {
                $mime = \getFileMime($path);
                if (!file_exists($path)) {
                    return;
                }
                $content = \file_get_contents($path);

                $response = response()->contentType($mime);
                $response = $response->data($content);
                \cache($path, $response);

            } else {
                $response = \cache($path);
            }

            return $response;
        }
    }
}
