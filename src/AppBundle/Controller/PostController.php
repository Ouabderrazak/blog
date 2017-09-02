<?php

namespace AppBundle\Controller;

use AppBundle\Entity\User;
use FOS\RestBundle\Controller\FOSRestController;
use Nelmio\ApiDocBundle\Annotation\ApiDoc;


class PostController extends FOSRestController
{

    /**
     * @return \Symfony\Component\HttpFoundation\Response
     *
     * Get all Posts Action
     *
     * @ApiDoc(
     *     headers={
     *         { "name"="Authorization", "required"=true, "description"="Bearer token" }
     *     },
     *
     *  resource=true,
     *  section = "Post",
     *  description="Action get all posts"
     * )
     */
    public function getPostsAction()
    {
        /** @var User $user */
//        $user = $this->get('security.token_storage')->getToken()->getUser();
        $posts = $this->get('doctrine')->getRepository('AppBundle:Post')->findAll();
        $view = $this->view($posts);
        return $this->handleView($view);
    }
}