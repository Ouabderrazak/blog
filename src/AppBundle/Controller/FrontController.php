<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class FrontController extends Controller
{
    public function indexAction()
    {
        $posts = $this->getDoctrine()->getRepository('AppBundle:Post')->findBy(['published' => true]);
        return $this->render(':Post:list.html.twig', ['posts' => $posts]);
    }

    public function showPostAction($id)
    {
        $post = $this->getDoctrine()->getRepository('AppBundle:Post')->findOneBy(['id' => $id]);
        return $this->render(':Post:show_post.html.twig', ['post' => $post]);
    }
}
